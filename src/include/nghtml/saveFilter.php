    <script type="text/ng-template" id="saveFilter.html">
        <div class="modal-header">
            <h3 class="modal-title">{{items.nameOfPage}}</h3>
        </div>

        <div class="modal-body">
        <TABLE class="table">
           <TR><TD><U><B>Name:</B> </U></TD>
           <TD><input name="name" type='text' size='75' ng-model="items.name" placeholder="Requied"><BR></TD></TR>
           <TR><TD><U><B>Description:</B> </U></TD>
           <TD><textarea name="description" type='text' rows="3" cols="75" ng-model="items.description"></textarea><BR></TD></TR>
           <TR><TD><U><B>Author: </B></U></TD>
           <TD><input name="author" type='text' size='50' ng-init="items.author=items.credit" ng-model="items.author"><BR></TD></TR>
           <TR><TD><U><B>CVE: </B></U></TD>
           <TD><input name="cve" type='text' size='50' ng-model="items.cve"><BR></TD></TR>
           <TR><TD><U><B>CWE: </B></U></TD>
           <TD><input name="cwe" type='text' size='50' ng-model="items.cwe"><BR></TD></TR>
           <TR><TD><U><B>WLB: </B></U></TD>
           <TD><input name="wlb" type='text' size='50' ng-model="items.wlb" maxlength="15"><BR></TD></TR>
           <TR><TD><U><B>Path: </B></U></TD>
           <TD><input name="path" type='text' size='50' ng-model="items.path"><BR></TD></TR>
        </TABLE>

            <accordion close-others="langSeleAdd">
                <accordion-group is-open="status.isLang">
                    <accordion-heading>
                        <center><B>Select Language:</B> {{ selected_lang.name }} ( Only Files : {{selected_lang.files}} )
                            <i class="pull-right glyphicon" ng-class="{'glyphicon-chevron-down': status.isLang, 'glyphicon-chevron-right': !status.isLang}"></i></center>
        
                    </accordion-heading>
        
                <div class="btn-group" dropdown is-open="status.isopen">

        
                <table><TR><TD>
                <h2>Name: <b>{{ selected_lang.name }}</b><BR>Files: <b>{{ selected_lang.files }} </b>
                <input id='filesVal' value='{{ selected_lang.files }}' type='hidden'>

            </TD></TR></table>
    
            
                  <button type="button" class="btn btn-primary dropdown-toggle" dropdown-toggle ng-disabled="disabled">Change<span class="caret"></span>
      </button>
        <ul class="dropdown-menu" role="menu" id='filesToScan'>
            <li ng-repeat="lang_item in languages  | orderBy:predicate:reverse" ng-controller="selectFiles"><a href="" ng-click="setValue()"><B>{{ lang_item.name }}</B> ( {{lang_item.files}} )</a></li>
        </ul>
    </div>
                </accordion-group>
            </accordion>
            
            
            <!--- GROUP ----------------------------->
            <accordion close-others="langSele" >
                <accordion-group is-open="status.isGroup">
                    <accordion-heading>
                        <center><B>Select Group:</B> {{ selected_group.name }} ( Only Files : {{ selected_group.custom_files }} )
                            <i class="pull-right glyphicon" ng-class="{'glyphicon-chevron-down': status.isGroup, 'glyphicon-chevron-right': !status.isGroup}"></i></center>
        
                    </accordion-heading>
        
    <div class="btn-group" dropdown is-open="status.isopen">

        
        <table><TR><TD>
        <h2>Name: <b>{{ selected_group.name }}</b>
            <BR>Files: <b>{{ selected_group.custom_files }} </b>
                    
        </h2>
        <input id='filesVal' value='{{ selected_lang.files }}' type='hidden'>

            </TD></TR></table>
    
                  <button type="button" class="btn btn-primary dropdown-toggle" dropdown-toggle ng-disabled="disabled">Change<span class="caret"></span>
      </button>
        <ul class="dropdown-menu" role="menu" id='filesToScan'>
            <li ng-repeat="group_item in groups  | orderBy:predicate:reverse" ng-controller="selectGroup"><a href="" ng-click="setValue()"><B>{{ group_item.name }}</B> ( {{ group_item.path  }} )</a></li>
        </ul>
    </div>
                </accordion-group>
            </accordion>
           <CENTER>
           <TABLE>
           <TR><TD><U>V1: </U></TD>
           <TD><input name="v1" type='text' size='80' ng-model="vValues.v1" placeholder="Requied"><BR></TD></TR>
           <TR><TD><U>V2: </U></TD>
           <TD><input name="v2" type='text' size='80' ng-model="vValues.v2"><BR></TD></TR>
           <TR><TD><U>V3: </U></TD>
           <TD><input name="v3" type='text' size='80' ng-model="vValues.v3"><BR></TD></TR>
            </TABLE>
            
        	<TABLE>
           <TR><TD><U>T1: </U></TD>
           <TD><input name="t1" type='text' size='80' ng-model="tValues.t1"><BR></TD></TR>
           <TR><TD><U>T2: </U></TD>
           <TD><input name="t2" type='text' size='80' ng-model="tValues.t2"><BR></TD></TR>
           <TR><TD><U>T3: </U></TD>
           <TD><input name="t3" type='text' size='80' ng-model="tValues.t3"><BR></TD></TR>
            </TABLE>
            
            <TABLE>
           <TR><TD><U>F1: </U></TD>
           <TD><input name="f1" type='text' size='80' ng-model="fValues.f1"><BR></TD></TR>
           <TR><TD><U>F2: </U></TD>
           <TD><input name="f2" type='text' size='80' ng-model="fValues.f2"><BR></TD></TR>
           <TR><TD><U>F3: </U></TD>
           <TD><input name="f3" type='text' size='80' ng-model="fValues.f3"><BR></TD></TR>
            </TABLE>
            </CENTER>

        </div>

        <div class="modal-footer">
		      <button class="btn btn-warning" ng-click="ok()"><span class="glyphicon glyphicon-floppy-open" aria-hidden="true"></span> Save</button>
              <button class="btn btn-primary" ng-click="cancel()"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Cancel</button>
        </div>
</script>