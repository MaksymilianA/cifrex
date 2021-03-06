<?php
//  
//    cIFrex Tool for Static Code Analysis
//    Copyright (C) 2020 cIFrex Team
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
?>
<!DOCTYPE html>
<html lang="en" ng-app="ui.bootstrap.demo">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>cIFrex 6.0 - Static Code Analysis Tool</title>

        <script src="./js/jquery.js" type='text/javascript'></script>
        <script src="./js/angular.js" type='text/javascript'></script>
        <script src="./js/ui-bootstrap-tpls-0.12.0.js" type='text/javascript'></script>
        <script src="./js/bootstrap.min.js" type='text/javascript'></script>
        
        <script src='./js/bootstrap-multiselect.js' type='text/javascript'></script>
        <link href='./css/bootstrap.css' rel='stylesheet' type='text/css'/>
        <link href='./css/bootstrap-multiselect.css' rel='stylesheet' type='text/css'/>

        <script src="./js/cifrex.js"></script>
        <script src="./js/modularwindow.js?"></script>
        <script src="./js/core.js?"></script>
        <script src="./js/angular-cookies.js"></script>
        <script src="./js/clipboard.min.js"></script>
        <script src="./js/ngclipboard.js"></script>
        <script src="./js/blockUI.js"></script>
  
      	<style>
		.back-to-top {
			position: fixed;
			bottom: 2em;
			right: 0px;
			text-decoration: none;
			color: #000000;
			background-color: rgba(235, 235, 235, 0.80);
			font-size: 12px;
			padding: 1em;
			display: none;
		}

		.back-to-top:hover {	
			background-color: rgba(135, 135, 135, 0.50);
		}	
	</style>
</head>

<BODY ng-controller="cifrexApp">

<DIV>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><IMG SRC='./css/logo4.png' width='100' height='23'></a>
    </div>
    <div>
      <ul class="nav navbar-nav">

<?php

function startHtmlUpToNavBar($active){

$out = '
        <li';
	if($active=='quick_scan') $out .= ' class="active"';
        $out .= '><a href="./index.php">Quick Scan</a></li>
        <li';
	if($active=='database') $out .= ' class="active"';
        $out .= ' class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Filters<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="./database.php">Show all</a></li>
            <li class="divider"></li>
            <li><a href="#" ng-click="saveFilter(\'lg\')">Add Filter</a></li>
        </ul></li>
        <li';
	if($active=='languages') $out .= ' class="active"';
        $out .= ' class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Languages<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="./languages.php">Show all</a></li>
            <li class="divider"></li>
            <li><a href="./runlang.php">Run Lang</a></li>
            <li class="divider"></li>
            <li><a href="#" ng-click="saveLang(\'lg\')">Add Lang</a></li>
        </ul></li>
        <li';
	if($active=='groups') $out .= ' class="active"';
        $out .= ' class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Groups<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="./groups.php">Show all</a></li>
            <li class="divider"></li>
            <li><a href="./rungroup.php">Run Group</a></li>
            <li class="divider"></li>
            <li><a href="#" ng-click="saveGroup(\'lg\')">Add Group</a></li>
        </ul></li>
        <li';
	if($active=='schedule') $out .= ' class="active"';
        $out .= '><a href="./schedule.php">Schedule</a></li>
        <li><a href="#" ng-click="license(\'lg\')">License</a></li>
        <li><a href="./infosys.php">phpInfo()</a></li>
</ul>
    </div>
  </div>
</nav>

';
	return $out;
}

	include("./include/nghtml/license.php");
	include("./include/nghtml/saveFilter.php");
	include("./include/nghtml/editFilter.php");
	include("./include/nghtml/saveGroup.php");
	include("./include/nghtml/saveLang.php");
	include("./include/nghtml/deleteFilter.php");
	include("./include/nghtml/resultFilter.php");
	include("./include/nghtml/resultShow.php");
	include("./include/nghtml/deleteFilter.php");
?>

