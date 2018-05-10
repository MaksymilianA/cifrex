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

// create link to database
$dbLink = new dbEngine($cconfig['db_config']);

// HTML START up to navBar
echo startHtmlUpToNavBar("groups");
?>

    <div class="container">
    <h2><center>Generate CI curl request for Group</center></h2>
    <div class="row">
        <div class="col-lg-15"><h5><U>Directory to scan</U></h5><INPUT type="text" id="katalog" class="form-control" id="directory" placeholder="Directory" ng-model="items.path" ng-Init="items.path ='<?php echo (isset($_COOKIE['dir'])) ? addslashes(htmlspecialchars($_COOKIE['dir'])) : $default['path']; ?>'"><BR></div>
     <accordion close-others="langSele">
                <accordion-group is-open="true">
                    <accordion-heading>
                        <center><B>Select Group:</B> {{ selected_group.name }} ( Only Files : {{ selected_group.custom_files }} )
                            <i class="pull-right glyphicon" ng-class="{'glyphicon-chevron-down': status.isLang, 'glyphicon-chevron-right': !status.isLang}"></i></center>
        
                    </accordion-heading>        
                    <div class="btn-group" dropdown is-open="status.isopen">
                        <table><TR><TD>
                        <h4>Name: <b><small>{{ selected_group.name }}</small></b>
                            <BR>Files: <b><small>{{ selected_group.custom_files }}</small></b>
                            Path: <b><small>{{ selected_group.path }}</small></B>
                            <BR>Description: <b><small>{{ selected_group.description }}</small></B>
                            <BR>Source: <b><small>{{ selected_group.source }}</small></B>
                            Created: <b><small>{{ selected_group.created }}</small></B>
                            LastMod: <b><small>{{ selected_group.lastmod }}</small></B>

                        </h4>
                        <input id='filesVal' value='{{ selected_lang.files }}' type='hidden'>

                            </TD></TR></table>
                                  <button type="button" class="btn btn-primary dropdown-toggle" dropdown-toggle ng-disabled="disabled"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> Change<span class="caret"></span>
                      </button>
                        <ul class="dropdown-menu" role="menu" id='filesToScan'>
                            <li ng-repeat="group_item in groups  | orderBy:predicate:reverse" ng-controller="selectGroup"><a href="" ng-click="setValue()"><B>{{ group_item.name }}</B> ( {{ group_item.path  }} )</a></li>
                        </ul>
                        <a href="#" class="btn btn-default" id="savefilter"  ng-click="saveGroup('lg')"><span class="glyphicon glyphicon-floppy-open" aria-hidden="true"></span> <B>Add new group</B></a>



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
                        <button alt="Copy" class="btn btn-link btn-sm" ng-value="textCmd='curl --data  &#x22;toDb='+saveToDb+'&execLog='+debugLog+'&katalog='+items.path+'&group_id='+selected_group.group_id+'&resultName='+items.nameOfScan+'&email='+items.email+'&credit='+items.credit+'&printOutput=True&trythispatterns=Group&#x22;  --user &#x22;<?php echo $_SERVER['PHP_AUTH_USER'].":".$_SERVER['PHP_AUTH_PW']; ?>&#x22; <?php echo $url_config;?>run-core-php/run-group.php'" ngclipboard data-clipboard-text="{{ textCmd }}"><span class="glyphicon glyphicon-copy" aria-hidden="true"></span> Copy and exec <span class="glyphicon glyphicon-copy" aria-hidden="true"></span></button></h4>
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
            
</div>    
</BODY>
</html>