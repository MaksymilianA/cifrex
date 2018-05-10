-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cifrex_prod
-- ------------------------------------------------------
-- Server version	10.1.22-MariaDB-1~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cifrex_filters`
--

DROP TABLE IF EXISTS `cifrex_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cifrex_filters` (
  `filtr_id` int(11) NOT NULL AUTO_INCREMENT,
  `filtr_hash` varchar(64) NOT NULL,
  `regexdb_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `cve` varchar(32) NOT NULL,
  `cwe` varchar(32) NOT NULL,
  `wlb` varchar(15) NOT NULL,
  `filtr` text NOT NULL,
  `date_created` int(11) unsigned NOT NULL,
  `date_lastmod` int(11) NOT NULL,
  `qs_lastused_path` text NOT NULL,
  PRIMARY KEY (`filtr_id`),
  KEY `filtr_id` (`filtr_id`),
  KEY `filtr_id_2` (`filtr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cifrex_filters`
--

LOCK TABLES `cifrex_filters` WRITE;
/*!40000 ALTER TABLE `cifrex_filters` DISABLE KEYS */;
INSERT INTO `cifrex_filters` VALUES (1,'bbe24a474d87633a02771fba6ed71cd9',0,'Maksymilian Arciemowicz','Classic Cross Site Scripting','The software does not neutralize or incorrectly neutralizes user-controllable input before it is placed in output that is used as a web page that is served to other users.','CVE-2011-4544','CWE-79','','{\n\"v1\":\"(.*echo.*\\\\$_(?:POST|GET)\\\\[(?:\\\\\'|\\\\\\\")(?<v1>\\\\w+)(?:\\\\\'|\\\\\\\")\\\\].*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"htmlspecialchars.*<v1>\",\n\"f2\":\"\\\\(int\\\\)\\\\$_(?:POST|GET)\\\\[.<v1>.\\\\]\",\n\"f3\":\"\"\n}',1422304649,1423683576,'/code/'),(2,'7a09eceac4b9b9a5fa67e1393917e38c',0,'Maksymilian Arciemowicz','Classic SQL Injection','The software constructs all or part of an SQL command using externally-influenced input from an upstream component, but it does not neutralize or incorrectly neutralizes special elements that could modify the intended SQL command when it is sent to a downstream component.','','CWE-89','','{\n\"v1\":\"\\\\$(?<v1>\\\\w+) \\\\=.*\\\\$_(?:GET|POST)\\\\[(?<v2>.*)\\\\]\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"mysql_query\\\\(.*\\\\$<v1>\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"addslashes.*\\\\$<v1>\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1422304752,1423683616,'/code/'),(3,'af32d7c8aec60d2566cbe02fe3cd02ef',0,'Kamil Uptas','Remote code execution in PHP','The software receives input from an upstream component, but it does not neutralize or incorrectly neutralizes code syntax before using the input in a dynamic evaluation call eval().','CVE-2012-0993','CWE-95','WLB-2012020080','{\n\"v1\":\"\\\\$(?<v1>\\\\w+)(?: |)\\\\=(?: |)\\\\$_(?:POST|GET|REQUEST|COOKIE)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"eval.*<v1>\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1422304896,1423683649,'/code/'),(4,'0951984e319624f6fab13755ca381049',0,'Maksymilian Arciemowicz','Remote/Local File Inclusion','In certain versions and configurations of PHP, this can allow an attacker to specify a URL to a local or remote location from which the software will obtain the code to execute. \n\nCheck oscommerce admin: \nosCommerce/OM/Core/Site/Admin/Application/modules_order_total/pages/edit.php','','CWE-98','','{\n\"v1\":\"(.*(?:\\\\@| )(?:include|require|file)\\\\(.*\\\\$\\\\_(?:POST|GET).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1422304955,1423683704,'/code/'),(5,'826541fdbe2015b1a0a0a147a50d6f4a',0,'Maksymilian Arciemowicz','Local File Inclusion phpMyAdmin 2.6.1','The PHP application receives input from an upstream component, but it does not restrict or incorrectly restricts the input before its usage in \"require,\" \"include,\" or similar functions.','CVE-2005-3299','CWE-98','WLB-2005100029','{\n\"v1\":\"(?<v1>\\\\w+) \\\\= \\\\$_(?:POST|GET)\\\\[\\\\\'(?<v2>\\\\w+)\\\\\'\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(?:include|require).*<v1>\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"file_exist.*<v1>\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1422305076,1423683800,'/code/'),(6,'8e0446e69cb88387f43aa7617a07d9ab',0,'Kamil Uptas','Source Code Disclosure in PHP','The PHP application receives input from an upstream component, but it does not restrict or incorrectly restricts the input before its usage in: file, file_get_contents, show_source or highlight_file.','','CWE-98','','{\n\"v1\":\"\\\\$(?<v1>\\\\w+)(?: |)\\\\=(?: |)\\\\$_(?:POST|GET|REQUEST|COOKIE)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(?:file|file_get_contents|show_source|highlight_file)(?: |)\\\\(.*<v1>\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"Content-Disposition\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1422315830,1423683837,'/code/'),(7,'43d5f08e421727343e900acb12e3828d',0,'Maksymilian Arciemowicz','Buffer overflow with strcpy and sprintf','The program copies an input buffer to an output buffer without verifying that the size of the input buffer is less than the size of the output buffer, leading to a buffer overflow.','','CWE-120','','{\n\"v1\":\"(?<v1>\\\\w+).=.(?:\\\\(.*\\\\)|).malloc\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*(?:sprintf|strcpy).*<v1>.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"<v1>.=.*malloc.*strlen\",\n\"f2\":\"(?:<v1>.*NULL|NULL.*<v1>)\",\n\"f3\":\"\"\n}',1422315924,1423683997,'/code/'),(8,'21c91caff0156f9234f08e83222f9a53',0,'Maksymilian Arciemowicz','Array overrun with char','The product uses untrusted input when calculating or using an array index, but the product does not validate or incorrectly validates the index to ensure the index references a valid position within the array.','','CWE-120','','{\n\"v1\":\"(?<v1>\\\\w{2,})(?:| )\\\\[(?:| )(?<v2>[\\\\-\\\\.\\\\>a-z]{4,})(?:| )\\\\]\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"char.* <v1>(?: |)\\\\[.*\\\\](?:\\\\;|,).*\",\n\"t2\":\"(?:<v2>(?: |)\\\\=(?: |)strlen)\",\n\"t3\":\"char.* <v1>(?: |)\\\\[(\\\\d)\\\\]\",\n\"f1\":\"if.*<v2>(?:| )\\\\<(?:| )(\\\\w+)\",\n\"f2\":\"char.* <v1>(?: |)\\\\[([A-Z]+)\\\\]\",\n\"f3\":\"\"\n}',1422316013,1423684047,'/code/'),(9,'f3b16c80ddc826b6457f6d56abaca16c',0,'Maksymilian Arciemowicz','Off-by one with wrong calculated buffer','The software does not correctly calculate the size to be used when allocating a buffer, which could lead to a buffer overflow.','','CWE-131','','{\n\"v1\":\"(?<v1>\\\\w+).\\\\=.(?:\\\\(\\\\)|).*lloc\\\\(\",\n\"v2\":\"for.\\\\(.*\\\\;.*\\\\<(?<v2>\\\\w+).*\",\n\"v3\":\"\",\n\"t1\":\"<v1>.*\\\\[<v2>\\\\].*\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"<v1>.\\\\=.(?:\\\\(\\\\)|).*lloc\\\\(.*\\\\+.1\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1422316140,1423685232,'/code/'),(10,'c40491d29cdce81e0b7a1e34e6a1e61a',0,'Maksymilian Arciemowicz','Off-by one with char table','If the incorrect calculation is used in the context of memory allocation, then the software may create a buffer that is smaller or larger than expected. If the allocated buffer is smaller than expected, this could lead to an out-of-bounds read or write (CWE-119), possibly causing a crash, allowing arbitrary code execution, or exposing sensitive dat','','CWE-131','','{\n\"v1\":\"char.* (?<v1>\\\\w+)\\\\[(?<v2>\\\\w+)\\\\]\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"for.*\\\\<\\\\=.<v2>\",\n\"t2\":\"<v1>\\\\[.*\\\\].\\\\=.*\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1422316228,1423685499,'/code/'),(11,'319632c706422680fa2de43811c2aae4',0,'Maksymilian Arciemowicz','Integer overflow multipling 10','The software performs a calculation that can produce an integer overflow or wraparound, when the logic assumes that the resulting value will always be larger than the original value. This can introduce other weaknesses when the calculation is used for resource management or execution control.','','CWE-189','','{\n\"v1\":\"int.* (?<v1>\\\\w{2,})(?:\\\\;|\\\\,| \\\\=)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(?:(<v1>.\\\\*.10)|(10.\\\\*.<v1>)|(<v1>.\\\\*\\\\=.10))\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"if.*(?:(<v1>.*\\\\<.*)|(<v1>.*\\\\>.*)|(.*(?:\\\\<|\\\\>)<v1))\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1422316311,1423684194,'/code/'),(12,'3e74d2b0a002564a42eea8d09d0940de',0,'Maksymilian Arciemowicz','phpinfo - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*phpinfo.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491225011,1492115022,'/code/'),(13,'fd15a519139a9c9d7d695a5b8d03e1f8',0,'Maksymilian Arciemowicz','shell_exec - General use in PHP (PCDF)','Execute command via shell and return the complete output as a string','','CWE-20','','{\n\"v1\":\"(?<v1>.*(|\\\\@)shell_exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491226893,1492115045,'/code/'),(14,'aa536339214cfa6709db17a31f11ca55',0,'Maksymilian Arciemowicz','exec  - General use in PHP (PCDF)','Execute an external program','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491227029,1491227029,'/code/'),(15,'b8f6107c368cac66c2400cb6f1957e1e',0,'Maksymilian Arciemowicz','system  - General use in PHP (PCDF)','system() is just like the C version of the function in that it executes the given command and outputs the result.','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)system( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491227131,1491227131,'/code/'),(16,'8f6e63dc1a419b7671d24a12e8345e19',0,'Maksymilian Arciemowicz','popen  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)popen( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491227415,1492115203,'/code/'),(17,'11daac7e16587a901d91b5875dd80a56',0,'Maksymilian Arciemowicz','proc_open  - General use in PHP (PCDF)','Execute a command and open file pointers for input/output','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)proc_open( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491227489,1491227489,'/code/'),(18,'383a3d38560bcd451bfd9b0c3a9a73f6',0,'Maksymilian Arciemowicz','curl_exec  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)curl_exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491227730,1491227730,'/code/'),(19,'11d7a77efff53de2278dd05e7d3bbe15',0,'Maksymilian Arciemowicz','curl_multi_exec - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)curl_multi_exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491227816,1491227816,'/code/'),(20,'021faa743b5a176dd66fcd83b1c77751',0,'Maksymilian Arciemowicz','show_source  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)show_source( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491227936,1491227936,'/code/'),(21,'f14cb9fd8b164a4c143e64bf2e59519a',0,'Maksymilian Arciemowicz','parse_ini_file  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)parse_ini_file( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491228053,1491228053,'/code/'),(22,'93271ea4ab4a7b3d110c7e3dac0873d7',0,'Maksymilian Arciemowicz','posix_mkfifo  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_mkfifo( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491228164,1491228164,'/code/'),(23,'b0d1ff904828c4c30a21220aaa8542f8',0,'Maksymilian Arciemowicz','pg_lo_import  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)pg_lo_import( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491228275,1491228275,'/code/'),(24,'2c2f8951e47243a323a89270e5c71e20',0,'Maksymilian Arciemowicz','dbmopen  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)dbmopen( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491228592,1491228592,'/code/'),(25,'8ba7508a300b0f33f07f8f2e39f18de6',0,'Maksymilian Arciemowicz','dbase_open - General use in PHP (PCDF)','Opens a database','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)dbase_open( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491228863,1492115184,'/code/'),(26,'4e0df5be56ad6e4f6cd65919e1e28ab4',0,'Maksymilian Arciemowicz','chgrp  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)chgrp( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491228947,1491228947,'/code/'),(27,'3bfd0aca3647faf0ec11cafae1511e49',0,'Maksymilian Arciemowicz','chown - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)chown( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491229020,1491229020,'/code/'),(28,'9e74e70ac6d14c612e29fe46f50fd959',0,'Maksymilian Arciemowicz','chmod  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)chmod( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491229101,1492115166,'/code/'),(29,'75ef3fa5c09bbdd37e55f4077c6bfad3',0,'Maksymilian Arciemowicz','symlink  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)symlink( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491229160,1492115132,'/code/'),(30,'3fc9d197498f861a23e89b0c43f5ea89',0,'Maksymilian Arciemowicz','pcntl_exec  - General use in PHP (PCDF)','Executes specified program in current process space','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)pcntl_exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491229236,1492115142,'/code/'),(31,'5dca3173350d0f32afdbfde1e9a24b3f',0,'Maksymilian Arciemowicz','define_syslog_variables  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)define_syslog_variables( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491229315,1492115151,'/code/'),(32,'4c55cb95c0f765fea4cf2be7135a52de',0,'Maksymilian Arciemowicz','posix_getpwuid - General use in PHP (PCDF)','Return info about a user by user id','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_getpwuid( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491229386,1491229386,'/code/'),(33,'acc3534ea8fe5e5d477d71d6294354ec',0,'Maksymilian Arciemowicz','posix_kill  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_kill( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491229458,1492115083,'/code/'),(34,'93271ea4ab4a7b3d110c7e3dac0873d7',0,'Maksymilian Arciemowicz','posix_mkfifo  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_mkfifo( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491246432,1492115124,'/code/'),(35,'ac47cb6902f50186a74d0abb340463b1',0,'Maksymilian Arciemowicz','posix_setpgid  - General use in PHP (PCDF)','Set process group id for job control','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_setpgid( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491246509,1491246509,'/code/'),(36,'66dae965324aa4325a252cfbecf41eae',0,'Maksymilian Arciemowicz','posix_setsid  - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_setsid( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491246573,1491246573,'/code/'),(37,'b61617218a92645949cff90fa4321476',0,'Maksymilian Arciemowicz','posix_setuid - General use in PHP (PCDF)','Set the UID of the current process','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_setuid( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491246648,1492115108,'/code/'),(38,'b34b01c99c351b0be3f004b914c1afd9',0,'Maksymilian Arciemowicz','posix_uname - General use in PHP (PCDF)','Gets information about the system.  Posix requires that assumptions must not be made about the format of the values, e.g. the assumption that a release may contain three digits or anything else returned by this function.','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_uname( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491246730,1492115003,'/code/'),(39,'57a2dd606a50261f14ef638aaab30fa6',0,'Maksymilian Arciemowicz','pclose - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)pclose( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491247601,1492114987,'/code//'),(40,'337112e1b3de91ebd1c509c1772bd8e8',0,'Maksymilian Arciemowicz','proc_nice  - General use in PHP (PCDF)','Change the priority of the current process','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)proc_nice( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491247779,1492114978,'/code/'),(41,'f17c2e06fcb12dbeb660321fee834865',0,'Maksymilian Arciemowicz','preg_repace PHP flag \'e\' code execution','Exploit \n<? preg_replace(\'/.*/e\',$_POST[\'code\']); ?>','','CWE-624','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)preg_replace( |)\\\\(.*\\\\/e.*\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491247985,1492119441,'/code/'),(42,'560c379afb8b101d3b001105922d602e',0,'Maksymilian Arciemowicz','create_function - General use in PHP (PCDF)','create_function — Create an anonymous (lambda-style) function\n\nWarning\nThis function has been DEPRECATED as of PHP 7.2.0. Relying on this function is highly discouraged.','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)create_function( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491248422,1492120219,'/code/'),(43,'2d113a4092c2b824ea52f3fa29434555',0,'Maksymilian Arciemowicz','Angular ng-bind-html XSS','','','CWE-79','','{\n\"v1\":\"(?<v1>.*ng\\\\-bind\\\\-html.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491296756,1492114433,'/code/'),(44,'fa12491f1d8d5c30fc22d3f1edae0fca',0,'Maksymilian Arciemowicz','mysql_real_escape_string - General use in PHP (PCDF)','mysql_real_escape_string is not safe. Don\'t rely on it for your SQL injection prevention.\n\nWhy: When you use mysql_real_escape_string on every variable and then concat it to your query, you are bound to forget that at least once, and once is all it takes. You can\'t force yourself in any way to never forget. In addition, you have to ensure that you use quotes in the SQL as well, which is not a natural thing to do if you are assuming the data is numeric, for example. Instead use prepared statements, or equivalent APIs that always do the correct kind of SQL escaping for you. (Most ORMs will do this escaping, as well as creating the SQL for you).','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)mysql_real_escape_string( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491301745,1492113864,'/code/'),(45,'1392ea8ecf0587a90a410747c796d65c',0,'Maksymilian Arciemowicz','display_errors  - General use in PHP (PCDF)','','','CWE-209','','{\n\"v1\":\"(?<v1>.*ini\\\\_set.*display_errors.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491302731,1492113841,'/code/'),(46,'b085c524c345c724492f99751927ff80',0,'Maksymilian Arciemowicz','memory unlimited PHP through memory_limit ini_set','','','CWE-399','','{\n\"v1\":\"(?<v1>.*ini_set\\\\(.*memory_limit.*(0|\\\\-1)\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491303402,1492113828,'/code/'),(47,'7d4a10b3dfc40da6cdf0271da3fd209d',0,'Maksymilian Arciemowicz','file_get_contents - General use in PHP (PCDF)','','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)file\\\\_get\\\\_contents( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1491818728,1492113814,'/code/'),(48,'4027b75ebf410e61dd83ecffd3f336b1',0,'Maksymilian Arciemowicz','passthru - General use in PHP (PCDF)','Execute an external program and display raw output\n\nvoid passthru ( string $command [, int &$return_var ] )','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)passthru( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1492116766,1492116786,'/code/'),(49,'4ee94857d062c758eb55698e031a5c28',0,'Maksymilian Arciemowicz','escapeshellcmd - General use in PHP (PCDF)','Escape shell metacharacters. Following characters are preceded by a backslash: &#;`|*?~<>^()[]{}$\\, \\x0A and \\xFF. \' and \" are escaped only if they are not paired. In Windows, all these characters plus % and ! are replaced by a space instead.','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)escapeshellcmd( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1492116884,1492117005,'/code/'),(50,'b2e9c4d7c4abacf3ed95fac064e704a8',0,'Maksymilian Arciemowicz','escapeshellarg  - General use in PHP (PCDF)','Escape a string to be used as a shell argument','','CWE-20','','{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)escapeshellarg( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}',1492117109,1492117109,'/code/');
/*!40000 ALTER TABLE `cifrex_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cifrex_groups`
--

DROP TABLE IF EXISTS `cifrex_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cifrex_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `path` varchar(4096) NOT NULL,
  `source` text NOT NULL,
  `custom_files` text NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_lastmod` int(11) NOT NULL,
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cifrex_groups`
--

LOCK TABLES `cifrex_groups` WRITE;
/*!40000 ALTER TABLE `cifrex_groups` DISABLE KEYS */;
INSERT INTO `cifrex_groups` VALUES (1,'CPC - Classic Patterns for C','C language','/code/','','c',1492119302,1492119358),(2,'PCDF -  PHP Classic Dangerous Functions','Common group of dangerous functions in PHP','/code/','','php',1491759452,1492115748);
/*!40000 ALTER TABLE `cifrex_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cifrex_languages`
--

DROP TABLE IF EXISTS `cifrex_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cifrex_languages` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `files` text NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_lastmod` int(11) NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cifrex_languages`
--

LOCK TABLES `cifrex_languages` WRITE;
/*!40000 ALTER TABLE `cifrex_languages` DISABLE KEYS */;
INSERT INTO `cifrex_languages` VALUES (1,'C','Common weaknesses for C','c|h',1422041351,1422041351),(2,'C++','Common weaknesses for C++','cc|cpp|hpp|hh',1422041379,1422041920),(3,'PHP','Common weaknesses for PHP scripts','php|php4',1422041468,1422041468),(4,'JAVA','Common weaknesses for JAVA','java',1422041637,1422041637),(5,'Perl','Common weaknesses for Perl','pl',1422042131,1422042131),(6,'Python','Common weaknesses for Python','py',1422042151,1422042151),(7,'HTML','Common weaknesses for HTML','htm|html',1422042173,1492119393),(8,'JavaScript','Common weaknesses for Java Script','js',1422042193,1422299038),(9,'Default','All files','*',1422041350,1422041350);
/*!40000 ALTER TABLE `cifrex_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cifrex_relation_fil_gro`
--

DROP TABLE IF EXISTS `cifrex_relation_fil_gro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cifrex_relation_fil_gro` (
  `relation_fg` int(11) NOT NULL AUTO_INCREMENT,
  `filtr_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  UNIQUE KEY `relation_fg` (`relation_fg`),
  KEY `relation_fg_2` (`relation_fg`),
  KEY `filtr_id` (`filtr_id`),
  KEY `group_id` (`group_id`),
  KEY `filtr_id_2` (`filtr_id`),
  KEY `relation_fg_3` (`relation_fg`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cifrex_relation_fil_gro`
--

LOCK TABLES `cifrex_relation_fil_gro` WRITE;
/*!40000 ALTER TABLE `cifrex_relation_fil_gro` DISABLE KEYS */;
INSERT INTO `cifrex_relation_fil_gro` VALUES (1,13,0),(2,14,0),(3,15,0),(4,16,0),(5,17,0),(6,18,0),(7,19,0),(8,20,0),(9,21,0),(10,25,0),(11,28,0),(12,30,0),(13,31,0),(14,32,0),(15,33,0),(16,34,0),(17,35,0),(18,36,0),(19,37,0),(20,38,0),(21,39,0),(22,40,0),(23,42,0),(24,45,0),(25,47,0),(26,48,0),(27,49,0),(28,50,0),(29,44,0),(30,12,0),(31,22,0),(32,23,0),(33,24,0),(34,26,0),(35,27,0),(36,29,0),(37,41,0),(38,46,0),(39,7,1),(40,8,1),(41,9,1),(42,10,1),(43,11,1),(44,12,2),(45,13,2),(46,14,2),(47,15,2),(48,16,2),(49,17,2),(50,18,2),(51,19,2),(52,20,2),(53,21,2),(54,22,2),(55,23,2),(56,24,2),(57,25,2),(58,26,2),(59,27,2),(60,28,2),(61,29,2),(62,30,2),(63,31,2),(64,32,2),(65,33,2),(66,34,2),(67,35,2),(68,36,2),(69,37,2),(70,38,2),(71,39,2),(72,40,2),(73,42,2),(74,44,2),(75,45,2),(76,47,2),(77,48,2),(78,49,2);
/*!40000 ALTER TABLE `cifrex_relation_fil_gro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cifrex_relation_lang_fil`
--

DROP TABLE IF EXISTS `cifrex_relation_lang_fil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cifrex_relation_lang_fil` (
  `relation_fl` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` int(11) NOT NULL,
  `filtr_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_fl`),
  KEY `filtr_id` (`filtr_id`),
  KEY `relation_fl` (`relation_fl`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cifrex_relation_lang_fil`
--

LOCK TABLES `cifrex_relation_lang_fil` WRITE;
/*!40000 ALTER TABLE `cifrex_relation_lang_fil` DISABLE KEYS */;
INSERT INTO `cifrex_relation_lang_fil` VALUES (1,3,1),(2,3,2),(3,3,3),(4,3,4),(5,3,5),(6,3,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,3,16),(17,3,17),(18,3,18),(19,3,19),(20,3,20),(21,3,21),(22,3,22),(23,3,23),(24,3,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,3,31),(32,3,32),(33,3,33),(34,3,34),(35,3,35),(36,3,36),(37,3,37),(38,3,38),(39,3,39),(40,3,40),(41,3,41),(42,3,42),(43,3,43),(44,3,44),(45,3,45),(46,3,46),(47,3,47),(48,3,48),(49,3,49),(50,3,50);
/*!40000 ALTER TABLE `cifrex_relation_lang_fil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cifrex_results`
--

DROP TABLE IF EXISTS `cifrex_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cifrex_results` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `date` int(11) NOT NULL,
  `path` text NOT NULL,
  `files` text NOT NULL,
  `filtr` text NOT NULL,
  `hasz` varchar(64) NOT NULL,
  `credit` text NOT NULL,
  `count_result` int(11) NOT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cifrex_results`
--

LOCK TABLES `cifrex_results` WRITE;
/*!40000 ALTER TABLE `cifrex_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `cifrex_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cifrex_results_details`
--

DROP TABLE IF EXISTS `cifrex_results_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cifrex_results_details` (
  `result_id` int(11) NOT NULL,
  `result` longtext NOT NULL,
  `debug_log` longtext NOT NULL,
  UNIQUE KEY `result_id` (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cifrex_results_details`
--

LOCK TABLES `cifrex_results_details` WRITE;
/*!40000 ALTER TABLE `cifrex_results_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cifrex_results_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-23 12:13:27
