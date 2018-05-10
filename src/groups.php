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


$handleIt = (isset($_GET['action'])) ? $_GET['action'] : 'index';

// create link to database
$dbLink = new dbEngine($cconfig['db_config']);

// HTML START up to navBar
echo startHtmlUpToNavBar("groups");
?>

    <div class="container">
     <div class="row"><CENTER>
      <h1>Search group:</h1><input type="text" ng-model="query" class="form-control" placeholder="Search">
    <table class="table table-striped">
      
      <tr>
        <th align='center'><a href="#" ng-click="predicate = 'group_id'; reverse = !reverse">ID</a></th>
        <th><a href="#" ng-click="predicate = 'name'; reverse = !reverse">Name</a></th>
        <th><a href="#" ng-click="predicate = 'description'; reverse = !reverse">Description</a></th>
        <th><a href="#" ng-click="predicate = 'path'; reverse = !reverse">Path</a></th>
        <th><a href="#" ng-click="predicate = 'custom_files'; reverse = !reverse">Files</a></th>
        <th><a href="#" ng-click="predicate = 'created'; reverse = !reverse">Created</a></th>
        <th><a href="#" ng-click="predicate = 'lastmod'; reverse = !reverse">Modified</a></th>
        <th>Filters</th>
        <th>Remove</th>
		<th>Edit</th>
      </tr>

      <tr ng-repeat="group in groups  | orderBy:predicate:reverse | filter:query" ng-controller="groupsCtrl">
        <td class="gray-lighter"> {{group.group_id}} </td>
        <td> {{group.name}} </td>
        <td> {{group.description}} </td>
        <td> {{group.path}} </td>
        <td> {{group.custom_files}} </td>
        <td> {{group.created}} </td>
        <td> {{group.lastmod}} </td>
        <td><A href="./managegroup.php?groupId={{group.group_id}}" class="btn btn-default" id="deletegroup"><span class="glyphicon glyphicon-object-align-left" aria-hidden="true"></span> <B>Manage</B></A></td>
        <td><A href="#" class="btn btn-warning" id="deletegroup" ng-click="deleteGroup('sm')"><span class="glyphicon glyphicon-floppy-remove" aria-hidden="true"></span> <B>Delete</B></A></td>
        <td><A href="#" class="btn btn-primary" id="editgroup" ng-click="editGroup('lg')"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> <B>Edit</B></A></td>
      </tr>
    </table>	
	<a href="#" class="btn btn-primary" id="savegroup" ng-click="saveGroup('lg')"><B>Add New</B></a><br><br>
	
    </CENTER>
     </div>
    </div>

</BODY>
</html>
