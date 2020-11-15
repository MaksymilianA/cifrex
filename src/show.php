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

include './config.php';

if(isset($_GET['show']) AND !empty($_GET['show']) AND is_string($_GET['show'])){

	$argPath=str_replace("../","/",str_replace("/..","/",$_GET['show']));

	if(strncmp($cconfig['core']['internal_openbasedir'], $argPath, strlen($cconfig['core']['internal_openbasedir']))==0)
	if(is_file($argPath)){
		$handle = fopen($argPath, "r");
		$buffer = "";
	  $title = explode("/", $argPath);
    $title = $title[(count($title)-1)];

		if ($handle){
			while (!feof($handle)) $buffer .= htmlentities(fgets($handle, 4096));

            $rozszez = explode('.', $argPath);

            $ext_crush = 'shBrushJScript';$brush = 'js';
            if(!empty($rozszez[count($rozszez)-1])){
                $rozszez=$rozszez[count($rozszez)-1];

                if ($rozszez == 'java') {
                    $ext_crush = 'shBrushJava';$brush = 'java';
                } elseif ($rozszez == 'php') {
                    $ext_crush = 'shBrushPhp';$brush = 'php';
                } elseif ($rozszez == 'cpp' OR $rozszez == 'c') {
                    $ext_crush = 'shBrushCpp';$brush = 'cpp';
                } elseif ($rozszez == 'xml') {
                    $ext_crush = 'shBrushXml';$brush = 'xml';
                } elseif ($rozszez == 'py') {
                    $ext_crush = 'shBrushPython';$brush = 'py';
                }elseif ($rozszez == 'sql') {
                    $ext_crush = 'shBrushSql';$brush = 'sql';
                }elseif ($rozszez == 'ry') {
                    $ext_crush = 'shBrushRuby';$brush = 'ry';
                }elseif ($rozszez == 'pl') {
                    $ext_crush = 'shBrushPerl';$brush = 'pl';
                }
            }

      $high=0;
			if(isset($_GET['l'])){
				$high = htmlspecialchars($_GET['l'], ENT_QUOTES);
			}

			echo '<html><head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<title>File: '.$title.'</title>
			<script type="text/javascript" src="include/syntaxhighlighter/scripts/shCore.js"></script>
			<script type="text/javascript" src="include/syntaxhighlighter/scripts/'.$ext_crush.'.js"></script>
			<link type="text/css" rel="stylesheet" href="include/syntaxhighlighter/styles/shCoreRDark.css"/>
			<script type="text/javascript">
			SyntaxHighlighter.defaults["quick-code"] = false;
			SyntaxHighlighter.all();
			</script>

			</head>
			<body bgcolor="#1A2426"><pre class="brush: '.$brush.';highlight: ['.$high.']">'.$buffer.'</pre></body>
			</html>';
			die();
		} else die("<CENTER>CAN'T OPEN FILE.<BR>fopen FAILED <P><A HREF='".$url_config."'>Back</A></CENTER>");
	} elseif(is_dir($argPath)) {
		$files = scandir($argPath);

		echo '<!DOCTYPE html><html lang="en">
		<head><title>cIFrex - Show directory</title>
		<style type="text/css" media="screen">
		    body {background-color: black;color: #D0D0D0;}
		    h1 {color: blue;}
		    a {color: #D80000;text-decoration: none;}
		</style></head><body><h4><U>Path:</U> / ';

		$rids=explode("/", $argPath);
		for($xd=0,$vci="";$xd<count($rids);$xd++){
				if(empty($rids[$xd])) continue;
				$vci .= $rids[$xd]."/";
				echo "<font size=4><A href='?show=/".$vci."'>".$rids[$xd]."</a> / ";
		}
		echo "</h4>";

		$results=array();
		foreach($files as $key => $value){
				$path = realpath($argPath.DIRECTORY_SEPARATOR.$value);
				if(!is_dir($path)) {
						$results[] = $path;
				} else if($value != "." && $value != "..") {
						$results[] = $path;
				}
		}
		foreach($results as $kci => $vci){
		    $rids=explode("/", $vci);
		    echo "<font size=4><A href='?show=".$vci."'>".$rids[count($rids)-1]."</a> ".((is_dir($vci)) ? '[ Dir ]' : '[ File ]')." size: ".filesize($vci)."</font><br>";
		}
}
	else { die("<CENTER>CAN'T OPEN FILE.<BR>Possible incorrect 'internal_openbasedir' variable <P><A HREF='".$url_config."'>Back</A></CENTER>"); }
}

?>
