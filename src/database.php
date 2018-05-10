<?php
//  
//    cIFrex Tool for Static Code Analysis
//    Copyright (C) 2015 cIFrex Team
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

$handleIt = (isset($_GET['action'])) ? $_GET['action'] : 'index';

// create link to database
$dbLink = new dbEngine($cconfig['db_config']);

// HTML START up to navBar
echo startHtmlUpToNavBar("database");
?>

    <div class="container">
     <div class="row"><CENTER>
      <h1>Search filtr:</h1><input type="text" ng-model="query" class="form-control" placeholder="Search"  ng-Init="query ='<?php echo (isset($_GET['q'])) ? htmlspecialchars(addslashes($_GET['q'])) : ''; ?>'">
    <table class="table table-striped">
       <tr>
        <th align='center'><a href="#" ng-click="predicate = 'id'; reverse = !reverse">ID</a></th>
        <th><a href="#" ng-click="predicate = 'title'; reverse = !reverse">Name</a></th>
        <th><a href="#" ng-click="predicate = 'env'; reverse = !reverse">Language</a></th>
        <th><a href="#" ng-click="predicate = 'cve'; reverse = !reverse">CVE</a></th>
        <th><a href="#" ng-click="predicate = 'cwe'; reverse = !reverse">CWE</a></th>
        <th><a href="#" ng-click="predicate = 'diff'; reverse = !reverse">Modified</a></th>
        <th>Remove</th>
		<th>Edit</th>
      </tr>
      <tr ng-repeat="filter in filters  | orderBy:predicate:reverse | filter:query" ng-controller="editFilterCtrl">
        <td class="gray-lighter"> {{filter.id}} </td>
        <td> {{filter.title}} </td>
        <td> {{filter.env}} </td>
        <td> <A href="http://cxsecurity.com/cveshow/{{filter.cve}}" alt="{{filter.cve}}"><b>{{filter.cve}}</b></A> </td>
        <td> <A href="http://cxsecurity.com/cwe/{{filter.cwe}}" alt="{{filter.cwe}}"><b>{{filter.cwe}}</b></A> </td>
        <td> {{filter.diff | date }} </td>
        <td><A href="#" class="btn btn-warning" id="deletefilter" ng-click="deleteFilter('lg')"><span class="glyphicon glyphicon-floppy-remove" aria-hidden="true"></span> <B>Delete</B></A></td>
        <td><A href="#" class="btn btn-primary" id="editfilter" ng-click="editFilter('lg')"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> <B>Edit</B></A></td>
      </tr>
    </table>	
	<a href="#" class="btn btn-primary" id="savefilter" ng-click="saveFilter('lg')"><B>Add New</B></a><br><br>
	
    </CENTER>
     </div>
    </div>

</BODY>
</html>
