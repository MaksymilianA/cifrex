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

// create link to database
$dbLink = new dbEngine($cconfig['db_config']);

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



// HTML START up to navBar
echo startHtmlUpToNavBar("languages");

$dbLink->sql("SELECT * FROM cifrex_languages WHERE lang_id='".intval($_COOKIE['langId'])."'");
$langResults=$dbLink->getResults();
?>
    <div class="container" ng-init="selected_lang.name='<?php echo $langResults[0]['name']; ?>';selected_lang.description='<?php echo $langResults[0]['description']; ?>';selected_lang.files='<?php echo $langResults[0]['files']; ?>'">
    <h2><center>Generate CI curl request for Language</center></h2>
    <div class="row">
        <div class="col-lg-15"><h5><U>Directory to scan</U></h5><INPUT type="text" id="katalog" class="form-control" id="directory" placeholder="Directory" ng-model="items.path" ng-Init="items.path ='<?php echo (isset($_COOKIE['dir'])) ? addslashes(htmlspecialchars($_COOKIE['dir'])) : $default['path']; ?>'"><BR></div>
              
                                 <accordion close-others="langSele">
                <accordion-group is-open="true">
                    <accordion-heading>
                        <center><B>Select Language:</B> {{ selected_lang.name }} ( Only Files : {{selected_lang.files}} )
                            <i class="pull-right glyphicon" ng-class="{'glyphicon-chevron-down': status.isLang, 'glyphicon-chevron-right': !status.isLang}"></i></center>
        
                    </accordion-heading>
                        <div class="btn-group" dropdown is-open="status.isopen">
                                    <div class="col-xs-17">
                            <div class="form-group">


                            <table><TR><TD>
                                <h4>Name: <small>{{ selected_lang.name }}</small> Files: <small>{{ selected_lang.files }}</small> Description: <b><small>{{ selected_lang.description }}</small></B></h4>
                            <input id='filesVal' value='{{ selected_lang.files }}' type='hidden'>
                                </TD></TR></table>

                                </div></div>

                                      <button type="button" class="btn btn-primary dropdown-toggle" dropdown-toggle ng-disabled="disabled"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> Change<span class="caret"></span>
                          </button>
                            <ul class="dropdown-menu" role="menu" id='filesToScan'>
                                <li ng-repeat="lang_item in languages  | orderBy:predicate:reverse" ng-controller="selectFiles"><a href="" ng-click="setValue()"><B>{{ lang_item.name }}</B> ( {{lang_item.files}} )</a></li>
                            </ul>
                            <a href="#" class="btn btn-default" id="savefilter"  ng-click="saveLang('lg')"><span class="glyphicon glyphicon-floppy-open" aria-hidden="true"></span> <B>Add new language</B></a>
                        </div>
                    
                </accordion-group>
            </accordion>
                                    
            <accordion>
                <accordion-group is-open="true">
                    <accordion-heading>
                        <center><B>Set properties of execution</B>
                            <i class="pull-right glyphicon" ng-class="{'glyphicon-chevron-down': status.isOther, 'glyphicon-chevron-right': !status.isOther}"></i></center>
                    </accordion-heading>
                    <div class="row">
                    <div class="col-xs-6">
                        <div class="row">

                        <div class="col-xs-6">

                                      <center><label>
                                        <input type="checkbox" <?php if($coo_toDb){echo 'ng-checked="true"';} ?> ng-model="saveToDbControl" ng-true-value="true" ng-false-value="false" ng-click="saveToDb = (saveToDb == 'false' ? 'true' : 'false')"> <b>Submit to database</b>
                                      </label></center>
                                        <input id='debugLogVal' value='{{ saveToDb }}' type='hidden'>
                                      </div>
                        <div class="col-xs-6">

                        <center><label>
                                          <input type="checkbox" <?php if($coo_exeL){echo 'ng-checked="true"';} ?> ng-model="execLogControl" ng-true-value="true" ng-false-value="false" ng-click="debugLog = (debugLog == 'false' ? 'true' : 'false')"> <b>Generate Execution Log</b>
                                      </label></center>
                                        <input id='execLog' value='{{ debugLog }}' type='hidden'>

                        </div></div>

                        <div id="runConsoleW">
                        <center>
                        <h4>
                        <button alt="Copy" class="btn btn-link btn-sm" ng-value="textCmd='curl --data  &#x22;toDb='+saveToDb+'&execLog='+debugLog+'&katalog='+items.path+'&lang_id='+selected_lang.lang_id+'&resultName='+items.nameOfScan+'&email='+items.email+'&credit='+items.credit+'&printOutput=True&trythispatterns=Lang&#x22;  --user &#x22;<?php echo $_SERVER['PHP_AUTH_USER'].":".$_SERVER['PHP_AUTH_PW']; ?>&#x22; <?php echo $url_config;?>run-core-php/run-lang.php'" ngclipboard data-clipboard-text="{{ textCmd }}"><span class="glyphicon glyphicon-copy" aria-hidden="true"></span> Copy and exec <span class="glyphicon glyphicon-copy" aria-hidden="true"></span></button></h4>
                        <textarea class="form-control" rows="5">{{ textCmd }}</textarea>
                        </center>
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
<!-- TABLE --> 
        <div id="tabeladiv">
            <a href="#" class="back-to-top">Back to Top</a>
        </div>
        </div></div></div>
    </BODY>
</html>