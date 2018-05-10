    <script type="text/ng-template" id="resultFilter.html">
        <div class="modal-header">
            <h3 class="modal-title">Details of #{{resId.result_id}} result</h3>
        </div>

        <div class="modal-body">
           <TABLE class="table">
           <TR><TD><U><B>ID:</B> </U></TD>
           <TD><input name="name" type='text' size='50' ng-model="resId.result_id"><BR></TD></TR>
           <TR><TD><U><B>Credit: </B></U></TD>
           <TD><input name="author" type='text' size='50' ng-model="resId.credit"><BR></TD></TR>
           <TR><TD><U><B>Date: </B></U></TD>
           <TD><input name="cve" type='text' size='50' ng-model="resId.date"><BR></TD></TR>
           <TR><TD><U><B>Path: </B></U></TD>
           <TD><input name="cwe" type='text' size='50' ng-model="resId.path"><BR></TD></TR>
			<TR><TD><U><B>Files: </B></U></TD>
           <TD><input name="path" type='text' size='50' ng-model="resId.files"><BR></TD></TR>
			<TR><TD><U><B>Hasz: </B></U></TD>
           <TD><input name="path" type='text' size='50' ng-model="resId.hasz"><BR></TD></TR>
            </TABLE>

           <H2>Used Pattern:</h2>
           <TABLE>
           <TR><TD><U>V1: </U></TD>
           <TD><input name="v1" type='text' size='80' ng-model="resId.filtr.v1"><BR></TD></TR>
           <TR><TD><U>V2: </U></TD>
           <TD><input name="v2" type='text' size='80' ng-model="resId.filtr.v2"><BR></TD></TR>
           <TR><TD><U>V3: </U></TD>
           <TD><input name="v3" type='text' size='80' ng-model="resId.filtr.v3"><BR></TD></TR>
            </TABLE>
            
        	<TABLE>
           <TR><TD><U>T1: </U></TD>
           <TD><input name="t1" type='text' size='80' ng-model="resId.filtr.t1"><BR></TD></TR>
           <TR><TD><U>T2: </U></TD>
           <TD><input name="t2" type='text' size='80' ng-model="resId.filtr.t2"><BR></TD></TR>
           <TR><TD><U>T3: </U></TD>
           <TD><input name="t3" type='text' size='80' ng-model="resId.filtr.t3"><BR></TD></TR>
            </TABLE>
            
            <TABLE>
           <TR><TD><U>F1: </U></TD>
           <TD><input name="f1" type='text' size='80' ng-model="resId.filtr.f1"><BR></TD></TR>
           <TR><TD><U>F2: </U></TD>
           <TD><input name="f2" type='text' size='80' ng-model="resId.filtr.f2"><BR></TD></TR>
           <TR><TD><U>F3: </U></TD>
           <TD><input name="f3" type='text' size='80' ng-model="resId.filtr.f3"><BR></TD></TR>
            </TABLE>
            
           <H2>Running log:</h2>
           <TABLE>
           <TR><TD><h5><PRE>{{ resId.debug_log }}</PRE></h5></TD></TR>
            </TABLE>
            
        </div>

        <div class="modal-footer">
			<button class="btn btn-danger" ng-click="delete()"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Remove</button>
            <button class="btn btn-default" ng-click="cancel()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Close</button>
        </div>
</script>