    <script type="text/ng-template" id="saveGroup.html">
        <div class="modal-header">
            <h3 class="modal-title">{{item_group.nameOfPage}}</h3>
        </div>

        <div class="modal-body">
           <TABLE class="table">
           <TR><TD><U><B>Name:</B> </U></TD>
           <TD><input name="name" type='text' size='50' ng-model="item_group.name" placeholder="Requied"><BR></TD></TR>
           <TR><TD><U><B>Description: </B></U></TD>
           <TD><input name="author" type='text' size='50' ng-model="item_group.description" placeholder="Requied"><BR></TD></TR>
           <TR><TD><U><B>Path: </B></U></TD>
           <TD><input name="cve" type='text' size='50' ng-model="item_group.path" placeholder="Requied"><BR></TD></TR>
           <TR><TD><U><B>Files: </B></U></TD>
           <TD><input name="cwe" type='text' size='50' ng-model="item_group.custom_files" placeholder="Requied"><BR></TD></TR>
           <TR><TD><U><B>Source: </B></U></TD>
           <TD><input name="cwe" type='text' size='50' ng-model="item_group.source"><BR></TD></TR>
	       </TABLE>
        </div>

        <div class="modal-footer">
            <button class="btn btn-warning" ng-click="ok()"><span class="glyphicon glyphicon-floppy-open" aria-hidden="true"></span> Save</button>
            <button class="btn btn-primary" ng-click="cancel()"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Cancel</button>
        </div>
</script>