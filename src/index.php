<?php
//  
//    cIFrex Tool for Static Code Analysis
//    Copyright (C) 2017 cIFrex Team
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see http://www.gnu.org/licenses/.
//
include './config.php';
include './include/general/db.php';
include './include/general/navbar.php';
include './include/general/getdata.php';

$handleIt = (isset($_GET['action'])) ? $_GET['action'] : 'index';

// create link to database
$dbLink = new dbEngine($cconfig['db_config']);

// HTML START up to navBar
echo startHtmlUpToNavBar("quick_scan");

if(isset($_COOKIE['langId']) AND is_numeric($_COOKIE['langId'])){
    $langIds = intval($_COOKIE['langId']); 
} else {
    $langIds = intval($default['defaultLandId']);
}

if(isset($_COOKIE['toDB'])){
    $coo_toDb = $_COOKIE['toDB'] ? True : False; 
} else {
    $coo_toDb = False;
}

if(isset($_COOKIE['execLog'])){
    $coo_exeL = $_COOKIE['execLog'] ? True : False; 
} else {
    $coo_exeL = $default['debugLogCreate'];
}

$dbLink->sql("SELECT * FROM `cifrex_languages` WHERE lang_id= '".$langIds."'");
$cookie_lang_nbrOfRes=$dbLink->numOfRows();
    
if($cookie_lang_nbrOfRes==1){
        $langdetail=$dbLink->getResults();
        $langdetail=$langdetail[0];
} else $cookie_lang_nbrOfRes=0;

?>

<div class="container">
<h4><b>Directory to scan</b></h4>
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1"><a href="#"  id="start_cifrex3" name="trythispatterns" data-loading-text="Loading..."><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></span>
        <INPUT type="text" id="katalog" class="form-control" id="directory" placeholder="Directory" ng-model="items.path" ng-Init="items.path ='<?php echo (isset($_COOKIE['dir'])) ? addslashes(htmlspecialchars($_COOKIE['dir'])) : $default['path']; ?>'">

<span class="input-group-btn">

<div dropdown is-open="status.isopen">            
<button type="button" class="btn btn-primary dropdown-toggle" dropdown-toggle ng-disabled="disabled">Only Files: {{selected_lang.files}}<span class="caret"></button>
<ul class="dropdown-menu" role="menu" id='filesToScan'>
<li ng-repeat="lang_item in languages | orderBy:predicate:reverse" ng-controller="selectFiles"><a href="" ng-click="setValue()"><B>{{ lang_item.name }}</B> ( {{lang_item.files}} )</a></li>
</ul>
<a href="#" class="btn btn-primary" id="savefilter" ng-click="saveLang('lg')"><span class="glyphicon glyphicon-floppy-open" aria-hidden="true"></span> <B>Add new language</B></a>
<input id="langId" value="{{ selected_lang.lang_id }}" type="hidden">
<input id="filesVal" value="{{ selected_lang.files }}" type="hidden">
    </div>

</span></div>
<br><div class="col-lg-12"><center><button id="start_cifrex" class="btn btn-default" name="trythispatterns" data-loading-text="Loading..." type="button"><FONT COLOR=white><B><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Start static code analysis!</B></font></button> <select id="select" multiple="multiple">
<?php
    $stack1 = array();
    $stack2 = array();
    $obj = json_decode(getFilters(),TRUE);

        foreach($obj as $key => $item){
            array_push($stack1, $obj[$key]['env']);
            array_push($stack2, array($obj[$key]['id'], $obj[$key]['title'], $obj[$key]['env'], $obj[$key]['cwe']));
        }
				$stack1 = array_unique($stack1);

				foreach ($stack1 as $value) {

                    echo "<optgroup label=\"".(!empty($value) ? htmlspecialchars($value) : 'else')."\">";
                            foreach ($stack2 as $valuek) {
                            if($value == $valuek[2]){
                            echo '<option value="'.intval($valuek[0]).'">'.htmlspecialchars($valuek[3]).' '.htmlspecialchars($valuek[1]).'</option>';
                            }
                            }
                }

                unset($stack1);
				unset($stack2);
                      
?>
    </select><button id="show_selected" class="btn btn-default" name="trythispatterns" data-loading-text="Loading..." type="button"><FONT COLOR=white><span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span> <B>Show selected</B></font> </button>
            <a href="#" class="btn btn-default" id="savefilter"  ng-click="saveFilter('lg')"><span class="glyphicon glyphicon-floppy-open" aria-hidden="true"></span> <B>Save Filter</B></a> <a href="./database.php" class="btn btn-default" id="gotoFilters"><span class="glyphicon glyphicon-random" aria-hidden="true"></span> <B>Filters</B></a> <a href="./destroycookie.php" class="btn btn-default"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> <B>Clean</B></a>
     </div>
<BR>&nbsp;<br>
<!-- TABLE -->
    <div id="tabeladiv">
          <div class="table-responsive-own">
              
        <center>
            <div id="patterns">

                    <INPUT type="hidden" name="filtrName" id='filtrName' ng-model="items.filtrName" ng-change="changeFiltrName()">
                    <INPUT type="hidden" name="filtrId" id='filtrId' ng-model="items.filtrId">
                    <INPUT type="hidden" name="filtrDescription" id='filtrDescription' ng-model="items.filtrDescription" ng-change="changeFiltrDescription()">
        
        <TABLE>
            <tbody>
                <tr>
                    <td width="1%"></td>
                    <td width="98%"><BR>
                    
              
          <TABLE class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="active"><center>Value</center></th>
                        <th class="active"><center>True</center></th>
                        <th class="active"><center>False</center></th>
                    </tr>
                </thead>

            <tbody>
                <tr class="active">
                    <td>1<BR><INPUT type="text" name="value1" placeholder="Requied" class="form-control input-sm" id="v1" size="100" ng-model="vValues.v1" ng-change="changePatternV1()" ng-Init="vValues.v1 ='<?php  echo (isset($_COOKIE['value1'])) ? addslashes(htmlspecialchars($_COOKIE['value1'])) : '' ?>';changePatternV1();"></td>
                    <td>1<BR><INPUT type="text" name="true1" class="form-control input-sm" id='t1' size="50" ng-model="tValues.t1" value="" ng-change="changePatternT1()" ng-Init="tValues.t1 ='<?php  echo (isset($_COOKIE['true1'])) ? addslashes(htmlspecialchars($_COOKIE['true1'])) : '' ?>';changePatternT1();"></td>
                    <td>1<BR><INPUT type="text" name="false1" class="form-control input-sm" id='f1' size="50" ng-model="fValues.f1" value="" ng-change="changePatternF1()" ng-Init="fValues.f1 ='<?php  echo (isset($_COOKIE['false1'])) ? addslashes(htmlspecialchars($_COOKIE['false1'])) : '' ?>';changePatternF1();"></td>
                </tr>
                <tr class="active">
                    <td>2<BR><INPUT test-change type="text" name="value2" class="form-control input-sm" id='v2' size="100" ng-model="vValues.v2" value="" ng-change="changePatternV2()"  ng-Init="vValues.v2 ='<?php  echo (isset($_COOKIE['value2'])) ? addslashes(htmlspecialchars($_COOKIE['value2'])) : '' ?>';changePatternV2();"></td>
                    <td>2<BR><INPUT type="text" name="true2" class="form-control input-sm"  size="50" id='t2' ng-model="tValues.t2" value="" ng-change="changePatternT2()" ng-Init="tValues.t2 ='<?php  echo (isset($_COOKIE['true2'])) ? addslashes(htmlspecialchars($_COOKIE['true2'])) : '' ?>';changePatternT2();"></td>
                    <td>2<BR><INPUT type="text" name="false2" class="form-control input-sm" size="50"  id='f2'ng-model="fValues.f2" value="" ng-change="changePatternF2()" ng-Init="fValues.f2 ='<?php  echo (isset($_COOKIE['false2'])) ? addslashes(htmlspecialchars($_COOKIE['false2'])) : '' ?>';changePatternF2();"></td>
                </tr>
                <tr class="active">
                    <td>3<BR><INPUT type="text" name="value3" class="form-control input-sm" size="100" id='v3' ng-model="vValues.v3" value="" ng-change="changePatternV3()" ng-Init="vValues.v3 ='<?php  echo (isset($_COOKIE['value3'])) ? addslashes(htmlspecialchars($_COOKIE['value3'])) : '' ?>';changePatternV3();"></td>
                    <td>3<BR><INPUT type="text" name="true3" class="form-control input-sm" size="100" id='t3' ng-model="tValues.t3" value="" ng-change="changePatternT3()" ng-Init="tValues.t3 ='<?php  echo (isset($_COOKIE['true3'])) ? addslashes(htmlspecialchars($_COOKIE['true3'])) : '' ?>';changePatternT3();"></td>
                    <td>3<BR><INPUT type="text" name="false3" class="form-control input-sm" size="100" id='f3' ng-model="fValues.f3" value="" ng-change="changePatternF3()" ng-Init="fValues.f3 ='<?php  echo (isset($_COOKIE['false3'])) ? addslashes(htmlspecialchars($_COOKIE['false3'])) : '' ?>';changePatternF3();"></td>
                </tr>    
            </tbody>
        </TABLE></td>
                    <td width="1%"></td>
                        </tr>
                        </tbody>
                        </TABLE>
                        </DIV>
                      
                <accordion>
                <accordion-group is-open="status.isOther">
                    <accordion-heading>
                        <center><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> <B>Set properties of execution</B>
                            <i class="pull-right glyphicon" ng-class="{'glyphicon-chevron-down': status.isOther, 'glyphicon-chevron-right': !status.isOther}"></i></center>
                    </accordion-heading>
    <div class="row">


        <div class="col-xs-6">
    		<div class="row">

			<div class="col-xs-6">

                          <center><label>
                            <input type="checkbox" <?php if($coo_toDb){echo 'ng-checked="true"';} ?> ng-model="saveToDbControl" ng-true-value="true" ng-false-value="false" ng-click="saveToDb = (saveToDb == 'false' ? 'true' : 'false')"> <b>Submit to database</b>
                          </label><input id='debugLogVal' value='{{ saveToDb }}' type='hidden'></center>
                          </div>
			<div class="col-xs-6">

            <center><label>
                              <input type="checkbox" <?php if($coo_exeL){echo 'ng-checked="true"';} ?> ng-model="execLogControl" ng-true-value="true" ng-false-value="false" ng-click="debugLog = (debugLog == 'false' ? 'true' : 'false')"> <b>Generate Execution Log</b></label><input id='execLog' value='{{ debugLog }}' type='hidden'>
            </center>
            </div>
            <div id="runConsoleW">
            <center>
            <h3><button alt="Copy" class="btn btn-link btn-sm" ng-value="textCmd='curl --data  &#x22;toDb='+saveToDb+'&execLog='+debugLog+'&katalog='+items.path+'&files='+selected_lang.files+'&value1='+BvValues.v1+'&true1='+BtValues.t1+'&false1='+BfValues.f1+'&value2='+BvValues.v2+'&true2='+BtValues.t2+'&false2='+BfValues.f2+'&value3='+BvValues.v3+'&true3='+BtValues.t3+'&false3='+BfValues.f3+'&resultName='+items.nameOfScan+'&email='+items.email+'&credit='+items.credit+'&filtrId='+items.filtrId+'&filtrName='+items.BfiltrName+'&filtrDescription='+items.BfiltrDescription+'&printOutput=False&trythispatterns=Single&#x22;  --user &#x22;<?php echo $_SERVER['PHP_AUTH_USER'].":".$_SERVER['PHP_AUTH_PW']; ?>&#x22; <?php echo $url_config;?>run-core-php/search.php'" ngclipboard data-clipboard-text="{{ textCmd }}"><span class="glyphicon glyphicon-copy" aria-hidden="true"></span> Copy and exec <span class="glyphicon glyphicon-copy" aria-hidden="true"></span></button></h3>
            <textarea class="form-control" rows="6">{{ textCmd }}</textarea>
            </center>
            </div>
                  
	    	</div>

        </div>

        <div class="col-xs-6">

		<div class="form-group">
  			<label class="control-label" for="inputSmall">Name of scan</label>
  			<INPUT type="text" class="form-control input-sm" id='nameOfScan' ng-model="items.nameOfScan" placeholder="Name of job" ng-Init="items.nameOfScan ='<?php echo $default['nameOfJob']; ?>'">
		</div>
		<div class="form-group">
  			<label class="control-label" for="inputSmall">Credit</label>
  			<INPUT type="text" class="form-control input-sm" id='credit' ng-model="items.credit" placeholder="Credit" ng-Init="items.credit ='<?php  echo (isset($_COOKIE['credit'])) ? addslashes(htmlspecialchars($_COOKIE['credit'])) : $default['credit']; ?>'">
		</div>
		<div class="form-group">
  			<label class="control-label" for="inputSmall">Send email with result</label>
  			<INPUT type="text" class="form-control input-sm" id='email' ng-model="items.email" placeholder="Send email with result (name@domain)" ng-Init="items.email ='<?php echo $default['email']; ?>'">
		</div>

        </div>
    </div>

                </accordion-group>
            </accordion>


        </div>
    </center>

        <div id="multisearch"></div>
        <center><button id="start_cifrex2" class="btn btn-default" name="trythispatterns" data-loading-text="Loading..." type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> <B>Start static code analysis!</B></button></center>
        <div id="wyniki"></div>
        <a href="#" class="back-to-top">Back to Top</a>
    </div>

        </div>
</BR></div>
</div>
</BODY>
</html>
