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

// Timezone
    date_default_timezone_set("CET"); 

// Common Web Settings
    include "config.url.php";

// Database Config
    include "config.db.php";

// Security
    $cconfig['core']['internal_openbasedir']='/code/';

// Email Sender Setting
    $cconfig['mail']['allow'] = True; //allow Send emails
    $cconfig['mail']['Name'] = "Robot cIFrex"; //senders name 
    $cconfig['mail']['email'] = "robot@local.cert.cx"; //senders e-mail adress 

// Multithreading
// Default 1 but if you have fast disk and CPU, you can set more proceses
    #$cconfig['multithreading']['cores'] = 1; // Number of processes. 
    $default['path']='/code/'; // set default path
    $default['nameOfJob']='Scan '.date("U").''; // name of jobs
    $default['credit']='Anonymous'; // started by ...
    $default['email']=''; // send email TO (default HTML)
    $default['defaultLandId']="0"; // default lang id
    $default['saveResult']=True; // save result in db ? {True,False}
    $default['debugLogCreate']=False; // generate debugLog ? {True,False}


?>