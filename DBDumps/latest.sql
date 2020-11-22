-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: cifrexdb
-- Generation Time: Nov 22, 2020 at 09:00 AM
-- Server version: 10.4.12-MariaDB-1:10.4.12+maria~bionic
-- PHP Version: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cifrex_prod`
--

-- --------------------------------------------------------

--
-- Table structure for table `cifrex_filters`
--

CREATE TABLE `cifrex_filters` (
  `filtr_id` int(11) NOT NULL,
  `filtr_hash` varchar(64) NOT NULL,
  `regexdb_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `cve` varchar(32) NOT NULL,
  `cwe` varchar(32) NOT NULL,
  `wlb` varchar(15) NOT NULL,
  `filtr` text NOT NULL,
  `date_created` int(11) UNSIGNED NOT NULL,
  `date_lastmod` int(11) NOT NULL,
  `qs_lastused_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cifrex_filters`
--

INSERT INTO `cifrex_filters` (`filtr_id`, `filtr_hash`, `regexdb_id`, `author`, `name`, `description`, `cve`, `cwe`, `wlb`, `filtr`, `date_created`, `date_lastmod`, `qs_lastused_path`) VALUES
(1, 'bbe24a474d87633a02771fba6ed71cd9', 0, 'Maksymilian Arciemowicz', 'Classic Cross Site Scripting', 'The software does not neutralize or incorrectly neutralizes user-controllable input before it is placed in output that is used as a web page that is served to other users.', 'CVE-2011-4544', 'CWE-79', '', '{\n\"v1\":\"(.*echo.*\\\\$_(?:POST|GET)\\\\[(?:\\\\\'|\\\\\\\")(?<v1>\\\\w+)(?:\\\\\'|\\\\\\\")\\\\].*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"htmlspecialchars.*<v1>\",\n\"f2\":\"\\\\(int\\\\)\\\\$_(?:POST|GET)\\\\[.<v1>.\\\\]\",\n\"f3\":\"\"\n}', 1422304649, 1423683576, '/code/'),
(2, '7a09eceac4b9b9a5fa67e1393917e38c', 0, 'Maksymilian Arciemowicz', 'Classic SQL Injection', 'The software constructs all or part of an SQL command using externally-influenced input from an upstream component, but it does not neutralize or incorrectly neutralizes special elements that could modify the intended SQL command when it is sent to a downstream component.', '', 'CWE-89', '', '{\n\"v1\":\"\\\\$(?<v1>\\\\w+) \\\\=.*\\\\$_(?:GET|POST)\\\\[(?<v2>.*)\\\\]\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"mysql_query\\\\(.*\\\\$<v1>\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"addslashes.*\\\\$<v1>\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1422304752, 1423683616, '/code/'),
(3, 'af32d7c8aec60d2566cbe02fe3cd02ef', 0, 'Kamil Uptas', 'Remote code execution in PHP', 'The software receives input from an upstream component, but it does not neutralize or incorrectly neutralizes code syntax before using the input in a dynamic evaluation call eval().', 'CVE-2012-0993', 'CWE-95', 'WLB-2012020080', '{\n\"v1\":\"\\\\$(?<v1>\\\\w+)(?: |)\\\\=(?: |)\\\\$_(?:POST|GET|REQUEST|COOKIE)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"eval.*<v1>\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1422304896, 1423683649, '/code/'),
(4, '0951984e319624f6fab13755ca381049', 0, 'Maksymilian Arciemowicz', 'Remote/Local File Inclusion', 'In certain versions and configurations of PHP, this can allow an attacker to specify a URL to a local or remote location from which the software will obtain the code to execute. \n\nCheck oscommerce admin: \nosCommerce/OM/Core/Site/Admin/Application/modules_order_total/pages/edit.php', '', 'CWE-98', '', '{\n\"v1\":\"(.*(?:\\\\@| )(?:include|require|file)\\\\(.*\\\\$\\\\_(?:POST|GET).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1422304955, 1423683704, '/code/'),
(5, '826541fdbe2015b1a0a0a147a50d6f4a', 0, 'Maksymilian Arciemowicz', 'Local File Inclusion phpMyAdmin 2.6.1', 'The PHP application receives input from an upstream component, but it does not restrict or incorrectly restricts the input before its usage in \"require,\" \"include,\" or similar functions.', 'CVE-2005-3299', 'CWE-98', 'WLB-2005100029', '{\n\"v1\":\"(?<v1>\\\\w+) \\\\= \\\\$_(?:POST|GET)\\\\[\\\\\'(?<v2>\\\\w+)\\\\\'\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(?:include|require).*<v1>\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"file_exist.*<v1>\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1422305076, 1423683800, '/code/'),
(6, '8e0446e69cb88387f43aa7617a07d9ab', 0, 'Kamil Uptas', 'Source Code Disclosure in PHP', 'The PHP application receives input from an upstream component, but it does not restrict or incorrectly restricts the input before its usage in: file, file_get_contents, show_source or highlight_file.', '', 'CWE-98', '', '{\n\"v1\":\"\\\\$(?<v1>\\\\w+)(?: |)\\\\=(?: |)\\\\$_(?:POST|GET|REQUEST|COOKIE)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(?:file|file_get_contents|show_source|highlight_file)(?: |)\\\\(.*<v1>\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"Content-Disposition\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1422315830, 1423683837, '/code/'),
(7, '43d5f08e421727343e900acb12e3828d', 0, 'Maksymilian Arciemowicz', 'Buffer overflow with strcpy and sprintf', 'The program copies an input buffer to an output buffer without verifying that the size of the input buffer is less than the size of the output buffer, leading to a buffer overflow.', '', 'CWE-120', '', '{\n\"v1\":\"(?<v1>\\\\w+).=.(?:\\\\(.*\\\\)|).malloc\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*(?:sprintf|strcpy).*<v1>.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"<v1>.=.*malloc.*strlen\",\n\"f2\":\"(?:<v1>.*NULL|NULL.*<v1>)\",\n\"f3\":\"\"\n}', 1422315924, 1423683997, '/code/'),
(8, '21c91caff0156f9234f08e83222f9a53', 0, 'Maksymilian Arciemowicz', 'Array overrun with char', 'The product uses untrusted input when calculating or using an array index, but the product does not validate or incorrectly validates the index to ensure the index references a valid position within the array.', '', 'CWE-120', '', '{\n\"v1\":\"(?<v1>\\\\w{2,})(?:| )\\\\[(?:| )(?<v2>[\\\\-\\\\.\\\\>a-z]{4,})(?:| )\\\\]\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"char.* <v1>(?: |)\\\\[.*\\\\](?:\\\\;|,).*\",\n\"t2\":\"(?:<v2>(?: |)\\\\=(?: |)strlen)\",\n\"t3\":\"char.* <v1>(?: |)\\\\[(\\\\d)\\\\]\",\n\"f1\":\"if.*<v2>(?:| )\\\\<(?:| )(\\\\w+)\",\n\"f2\":\"char.* <v1>(?: |)\\\\[([A-Z]+)\\\\]\",\n\"f3\":\"\"\n}', 1422316013, 1423684047, '/code/'),
(9, 'f3b16c80ddc826b6457f6d56abaca16c', 0, 'Maksymilian Arciemowicz', 'Off-by one with wrong calculated buffer', 'The software does not correctly calculate the size to be used when allocating a buffer, which could lead to a buffer overflow.', '', 'CWE-131', '', '{\n\"v1\":\"(?<v1>\\\\w+).\\\\=.(?:\\\\(\\\\)|).*lloc\\\\(\",\n\"v2\":\"for.\\\\(.*\\\\;.*\\\\<(?<v2>\\\\w+).*\",\n\"v3\":\"\",\n\"t1\":\"<v1>.*\\\\[<v2>\\\\].*\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"<v1>.\\\\=.(?:\\\\(\\\\)|).*lloc\\\\(.*\\\\+.1\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1422316140, 1423685232, '/code/'),
(10, 'c40491d29cdce81e0b7a1e34e6a1e61a', 0, 'Maksymilian Arciemowicz', 'Off-by one with char table', 'If the incorrect calculation is used in the context of memory allocation, then the software may create a buffer that is smaller or larger than expected. If the allocated buffer is smaller than expected, this could lead to an out-of-bounds read or write (CWE-119), possibly causing a crash, allowing arbitrary code execution, or exposing sensitive dat', '', 'CWE-131', '', '{\n\"v1\":\"char.* (?<v1>\\\\w+)\\\\[(?<v2>\\\\w+)\\\\]\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"for.*\\\\<\\\\=.<v2>\",\n\"t2\":\"<v1>\\\\[.*\\\\].\\\\=.*\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1422316228, 1423685499, '/code/'),
(11, '319632c706422680fa2de43811c2aae4', 0, 'Maksymilian Arciemowicz', 'Integer overflow multipling 10', 'The software performs a calculation that can produce an integer overflow or wraparound, when the logic assumes that the resulting value will always be larger than the original value. This can introduce other weaknesses when the calculation is used for resource management or execution control.', '', 'CWE-189', '', '{\n\"v1\":\"int.* (?<v1>\\\\w{2,})(?:\\\\;|\\\\,| \\\\=)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(?:(<v1>.\\\\*.10)|(10.\\\\*.<v1>)|(<v1>.\\\\*\\\\=.10))\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"if.*(?:(<v1>.*\\\\<.*)|(<v1>.*\\\\>.*)|(.*(?:\\\\<|\\\\>)<v1))\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1422316311, 1423684194, '/code/'),
(12, '3e74d2b0a002564a42eea8d09d0940de', 0, 'Maksymilian Arciemowicz', 'phpinfo - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*phpinfo.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491225011, 1492115022, '/code/'),
(13, 'fd15a519139a9c9d7d695a5b8d03e1f8', 0, 'Maksymilian Arciemowicz', 'shell_exec - General use in PHP (PCDF)', 'Execute command via shell and return the complete output as a string', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*(|\\\\@)shell_exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491226893, 1492115045, '/code/'),
(14, 'aa536339214cfa6709db17a31f11ca55', 0, 'Maksymilian Arciemowicz', 'exec  - General use in PHP (PCDF)', 'Execute an external program', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491227029, 1491227029, '/code/'),
(15, 'b8f6107c368cac66c2400cb6f1957e1e', 0, 'Maksymilian Arciemowicz', 'system  - General use in PHP (PCDF)', 'system() is just like the C version of the function in that it executes the given command and outputs the result.', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)system( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491227131, 1491227131, '/code/'),
(16, '8f6e63dc1a419b7671d24a12e8345e19', 0, 'Maksymilian Arciemowicz', 'popen  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)popen( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491227415, 1492115203, '/code/'),
(17, '11daac7e16587a901d91b5875dd80a56', 0, 'Maksymilian Arciemowicz', 'proc_open  - General use in PHP (PCDF)', 'Execute a command and open file pointers for input/output', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)proc_open( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491227489, 1491227489, '/code/'),
(18, '383a3d38560bcd451bfd9b0c3a9a73f6', 0, 'Maksymilian Arciemowicz', 'curl_exec  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)curl_exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491227730, 1491227730, '/code/'),
(19, '11d7a77efff53de2278dd05e7d3bbe15', 0, 'Maksymilian Arciemowicz', 'curl_multi_exec - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)curl_multi_exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491227816, 1491227816, '/code/'),
(20, '021faa743b5a176dd66fcd83b1c77751', 0, 'Maksymilian Arciemowicz', 'show_source  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)show_source( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491227936, 1491227936, '/code/'),
(21, 'f14cb9fd8b164a4c143e64bf2e59519a', 0, 'Maksymilian Arciemowicz', 'parse_ini_file  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)parse_ini_file( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491228053, 1491228053, '/code/'),
(22, '93271ea4ab4a7b3d110c7e3dac0873d7', 0, 'Maksymilian Arciemowicz', 'posix_mkfifo  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_mkfifo( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491228164, 1491228164, '/code/'),
(23, 'b0d1ff904828c4c30a21220aaa8542f8', 0, 'Maksymilian Arciemowicz', 'pg_lo_import  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)pg_lo_import( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491228275, 1491228275, '/code/'),
(24, '2c2f8951e47243a323a89270e5c71e20', 0, 'Maksymilian Arciemowicz', 'dbmopen  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)dbmopen( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491228592, 1491228592, '/code/'),
(25, '8ba7508a300b0f33f07f8f2e39f18de6', 0, 'Maksymilian Arciemowicz', 'dbase_open - General use in PHP (PCDF)', 'Opens a database', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)dbase_open( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491228863, 1492115184, '/code/'),
(26, '4e0df5be56ad6e4f6cd65919e1e28ab4', 0, 'Maksymilian Arciemowicz', 'chgrp  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)chgrp( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491228947, 1491228947, '/code/'),
(27, '3bfd0aca3647faf0ec11cafae1511e49', 0, 'Maksymilian Arciemowicz', 'chown - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)chown( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491229020, 1491229020, '/code/'),
(28, '9e74e70ac6d14c612e29fe46f50fd959', 0, 'Maksymilian Arciemowicz', 'chmod  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)chmod( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491229101, 1492115166, '/code/'),
(29, '75ef3fa5c09bbdd37e55f4077c6bfad3', 0, 'Maksymilian Arciemowicz', 'symlink  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)symlink( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491229160, 1492115132, '/code/'),
(30, '3fc9d197498f861a23e89b0c43f5ea89', 0, 'Maksymilian Arciemowicz', 'pcntl_exec  - General use in PHP (PCDF)', 'Executes specified program in current process space', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)pcntl_exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491229236, 1492115142, '/code/'),
(31, '5dca3173350d0f32afdbfde1e9a24b3f', 0, 'Maksymilian Arciemowicz', 'define_syslog_variables  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)define_syslog_variables( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491229315, 1492115151, '/code/'),
(32, '4c55cb95c0f765fea4cf2be7135a52de', 0, 'Maksymilian Arciemowicz', 'posix_getpwuid - General use in PHP (PCDF)', 'Return info about a user by user id', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_getpwuid( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491229386, 1491229386, '/code/'),
(33, 'acc3534ea8fe5e5d477d71d6294354ec', 0, 'Maksymilian Arciemowicz', 'posix_kill  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_kill( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491229458, 1492115083, '/code/'),
(34, '93271ea4ab4a7b3d110c7e3dac0873d7', 0, 'Maksymilian Arciemowicz', 'posix_mkfifo  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_mkfifo( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491246432, 1492115124, '/code/'),
(35, 'ac47cb6902f50186a74d0abb340463b1', 0, 'Maksymilian Arciemowicz', 'posix_setpgid  - General use in PHP (PCDF)', 'Set process group id for job control', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_setpgid( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491246509, 1491246509, '/code/'),
(36, '66dae965324aa4325a252cfbecf41eae', 0, 'Maksymilian Arciemowicz', 'posix_setsid  - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_setsid( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491246573, 1491246573, '/code/'),
(37, 'b61617218a92645949cff90fa4321476', 0, 'Maksymilian Arciemowicz', 'posix_setuid - General use in PHP (PCDF)', 'Set the UID of the current process', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_setuid( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491246648, 1492115108, '/code/'),
(38, 'b34b01c99c351b0be3f004b914c1afd9', 0, 'Maksymilian Arciemowicz', 'posix_uname - General use in PHP (PCDF)', 'Gets information about the system.  Posix requires that assumptions must not be made about the format of the values, e.g. the assumption that a release may contain three digits or anything else returned by this function.', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)posix_uname( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491246730, 1492115003, '/code/'),
(39, '57a2dd606a50261f14ef638aaab30fa6', 0, 'Maksymilian Arciemowicz', 'pclose - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)pclose( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491247601, 1492114987, '/code//'),
(40, '337112e1b3de91ebd1c509c1772bd8e8', 0, 'Maksymilian Arciemowicz', 'proc_nice  - General use in PHP (PCDF)', 'Change the priority of the current process', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)proc_nice( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491247779, 1492114978, '/code/'),
(41, 'f17c2e06fcb12dbeb660321fee834865', 0, 'Maksymilian Arciemowicz', 'preg_repace PHP flag \'e\' code execution', 'Exploit \n<? preg_replace(\'/.*/e\',$_POST[\'code\']); ?>', '', 'CWE-624', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)preg_replace( |)\\\\(.*\\\\/e.*\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491247985, 1492119441, '/code/'),
(42, '560c379afb8b101d3b001105922d602e', 0, 'Maksymilian Arciemowicz', 'create_function - General use in PHP (PCDF)', 'create_function √¢‚Ç¨‚Äù Create an anonymous (lambda-style) function\n\nWarning\nThis function has been DEPRECATED as of PHP 7.2.0. Relying on this function is highly discouraged.', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)create_function( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491248422, 1492120219, '/code/'),
(43, '2d113a4092c2b824ea52f3fa29434555', 0, 'Maksymilian Arciemowicz', 'Angular ng-bind-html XSS', '', '', 'CWE-79', '', '{\n\"v1\":\"(?<v1>.*ng\\\\-bind\\\\-html.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491296756, 1492114433, '/code/'),
(44, 'fa12491f1d8d5c30fc22d3f1edae0fca', 0, 'Maksymilian Arciemowicz', 'mysql_real_escape_string - General use in PHP (PCDF)', 'mysql_real_escape_string is not safe. Don\'t rely on it for your SQL injection prevention.\n\nWhy: When you use mysql_real_escape_string on every variable and then concat it to your query, you are bound to forget that at least once, and once is all it takes. You can\'t force yourself in any way to never forget. In addition, you have to ensure that you use quotes in the SQL as well, which is not a natural thing to do if you are assuming the data is numeric, for example. Instead use prepared statements, or equivalent APIs that always do the correct kind of SQL escaping for you. (Most ORMs will do this escaping, as well as creating the SQL for you).', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)mysql_real_escape_string( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491301745, 1492113864, '/code/'),
(45, '1392ea8ecf0587a90a410747c796d65c', 0, 'Maksymilian Arciemowicz', 'display_errors  - General use in PHP (PCDF)', '', '', 'CWE-209', '', '{\n\"v1\":\"(?<v1>.*ini\\\\_set.*display_errors.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491302731, 1492113841, '/code/'),
(46, 'b085c524c345c724492f99751927ff80', 0, 'Maksymilian Arciemowicz', 'memory unlimited PHP through memory_limit ini_set', '', '', 'CWE-399', '', '{\n\"v1\":\"(?<v1>.*ini_set\\\\(.*memory_limit.*(0|\\\\-1)\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491303402, 1492113828, '/code/'),
(47, '7d4a10b3dfc40da6cdf0271da3fd209d', 0, 'Maksymilian Arciemowicz', 'file_get_contents - General use in PHP (PCDF)', '', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)file\\\\_get\\\\_contents( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1491818728, 1492113814, '/code/'),
(48, '4027b75ebf410e61dd83ecffd3f336b1', 0, 'Maksymilian Arciemowicz', 'passthru - General use in PHP (PCDF)', 'Execute an external program and display raw output\n\nvoid passthru ( string $command [, int &$return_var ] )', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)passthru( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1492116766, 1492116786, '/code/'),
(49, '4ee94857d062c758eb55698e031a5c28', 0, 'Maksymilian Arciemowicz', 'escapeshellcmd - General use in PHP (PCDF)', 'Escape shell metacharacters. Following characters are preceded by a backslash: &#;`|*?~<>^()[]{}$\\, \\x0A and \\xFF. \' and \" are escaped only if they are not paired. In Windows, all these characters plus % and ! are replaced by a space instead.', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)escapeshellcmd( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1492116884, 1492117005, '/code/'),
(50, 'b2e9c4d7c4abacf3ed95fac064e704a8', 0, 'Maksymilian Arciemowicz', 'escapeshellarg  - General use in PHP (PCDF)', 'Escape a string to be used as a shell argument', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*( |\\\\=|^|\\\\@)escapeshellarg( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1492117109, 1492117109, '/code/'),
(51, 'b122e9305db28cb828cc6e73273882d5', 0, 'Maksymilian Arciemowicz', 'Spring Security CSRF Disable', 'csrf().disable()', '', 'CWE-352', '', '{\n\"v1\":\"(?<v1>.*.csrf\\\\(\\\\).disable\\\\(\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401051, 1537401051, '/code/'),
(52, 'a09118a38883b9604daaf8b185ecd3f2', 0, 'Maksymilian Arciemowicz', 'Spring Generic message-converters configuration', 'For XXE purposes', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*message\\\\-converters.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401052, 1537401052, '/code/'),
(53, '557a122f2ddda7f6f6642de3aeec5b94', 0, 'Maksymilian Arciemowicz', 'Spring Generic WebSecurityConfigurerAdapter extend', 'Security configuration to review', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.* WebSecurityConfigurerAdapter.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401053, 1537401053, '/code/'),
(54, '2260d159583e6e1dcaa4527f150f6831', 0, 'Maksymilian Arciemowicz', 'Spring security:authentication-manager Tag', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*\\\\<security\\\\:authentication\\\\-manager.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401054, 1537401054, '/code/'),
(55, 'f2fb7e1dbcf142eedffc76364f8f472a', 0, 'Maksymilian Arciemowicz', 'Spring security:user Tag', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*\\\\<security\\\\:user.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401055, 1537401055, '/code/'),
(56, '21973d40da3c15d573400c8c2b1f27a4', 0, 'Maksymilian Arciemowicz', 'Spring security:intercept-url Tag', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*\\\\<security\\\\:intercept\\\\-url.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401056, 1537401056, '/code/'),
(57, 'feb3d09b565f8e78ccd1ff087625040f', 0, 'Maksymilian Arciemowicz', 'Spring security:http-basic Tag', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*\\\\<security\\\\:http\\\\-basic.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401057, 1537401057, '/code/'),
(58, '12d7b4c222fa3f316f900e9bb884d098', 0, 'Maksymilian Arciemowicz', 'Spring form-login Tag', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*\\\\<security\\\\:form\\\\-login.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401058, 1537401058, '/code/'),
(59, '42c83d23b677182e02cc69cc1a861dea', 0, 'Maksymilian Arciemowicz', 'Spring custom-filter Tag', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*\\\\<security\\\\:custom\\\\-filter.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401059, 1537401059, '/code/'),
(60, 'bf3d73f82b01f45d0993f4cd6f9af101', 0, 'Maksymilian Arciemowicz', 'Spring @Controller Tag', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*\\\\@Controller.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401060, 1537401060, '/code/'),
(61, '6d6e94d85ddb2e88c9e6b52fd4b936e7', 0, 'Maksymilian Arciemowicz', 'Spring public Authentication Type Class', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*public Authentication .*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*import org\\\\.springframework\\\\.security\\\\.core\\\\.Authentication.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401061, 1537401061, '/code/'),
(62, 'e1714cb7ae96a292280674679a3d4a08', 0, 'Maksymilian Arciemowicz', 'Spring RequestMapping Generic', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*\\\\@RequestMapping.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401062, 1537401062, '/code/'),
(63, '4c0ff21de4b730b9606562dc376cf010', 0, 'Maksymilian Arciemowicz', 'Apache Tomcat Auth Basic Credencials', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(.*\\\\<user.*username.*password.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401063, 1537401063, '/code/'),
(64, '9d7a94c24661b40b9322e9bec86408bd', 0, 'Maksymilian Arciemowicz', 'JAVA Filtering < > in Java Generic', 'https://wiki.sei.cmu.edu/confluence/display/java/IDS01-J.+Normalize+strings+before+validating+them', '', 'CWE-20', '', '{\n\"v1\":\"(?<v1>.*Pattern\\\\.compile\\\\(\\\\\\\"\\\\[\\\\<\\\\>\\\\]\\\\\\\"\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401064, 1537401064, '/code/'),
(65, 'f8829cd4d8b0faba017ce653388dd3e3', 0, 'Maksymilian Arciemowicz', 'JAVA getParameter - General usage in Java', 'General usage of getParameter for Java', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*getParameter.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401065, 1537401065, '/code/'),
(66, '80f5f49ef72db614427fb45d49f57294', 0, 'Maksymilian Arciemowicz', 'JAVA Generic new URL object', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*new URL.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401066, 1537401066, '/code/'),
(67, '02a39b6358af7f9409eeaa3d92ff58a0', 0, 'Maksymilian Arciemowicz', 'JAVA Generic Runtime.getRuntime object', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*Runtime\\\\.(exec|getRuntime).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401067, 1537401067, '/code/'),
(68, 'e8fa15e0299fa2b92b7d3c853bdc4aa8', 0, 'Maksymilian Arciemowicz', 'JAVA Delete method ignore value returned by method', 'https://wiki.sei.cmu.edu/confluence/display/java/EXP00-J.+Do+not+ignore+values+returned+by+methods', '', 'CWE-754', '', '{\n\"v1\":\"(?<v1>.*(\\\\w+)\\\\.delete\\\\(\\\\)\\\\;.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401068, 1537401068, '/code/'),
(69, 'bb63869cb3cedee7d685e06eddcae3bc', 0, 'Maksymilian Arciemowicz', 'Java Deserialization Potential Issue through ObjectInputStream', 'https://www.owasp.org/index.php/Deserialization_of_untrusted_data\n\nInputStream is = request.getInputStream();\nObjectInputStream ois = new ObjectInputStream(is);\nAcmeObject acme = (AcmeObject)ois.readObject();', '', 'CWE-502', '', '{\n\"v1\":\"(?<v2>.* ObjectInputStream (?<v1>[a-zA-Z0-9_]{1,32})(| )\\\\=(| )new ObjectInputStream.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*<v1>\\\\.readObject.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401069, 1537401069, '/code/'),
(70, 'fc2290f98a2bd9fc3630a03506d1171a', 0, 'Maksymilian Arciemowicz', 'JAVA Session Timeout from XML', 'For this, it\'s best practices to :\n\nSet session timeout to the minimal value possible depending on the context of the application.\nAvoid \"infinite\" session timeout.\nPrefer declarative definition of the session timeout in order to apply global timeout for all application sessions.\nTrace session creation/destroy in order to analyse creation trend and try to detect anormal session number creation (application profiling phase in a attack).', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*session\\\\-timeout.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401070, 1537401070, '/code/'),
(71, 'f0f6c4d10567a2f4f6877ccb5aab972e', 0, 'Maksymilian Arciemowicz', 'JAVA Unchecked Return Value to NULL Pointer Dereference', '', '', 'CWE-690', '', '{\n\"v1\":\"(.*String (\\\\w+) \\\\= (?<v1>\\\\w+)\\\\(\\\\)\\\\;.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*if( |)\\\\(.*<v1>\\\\.equals( |)\\\\(.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401071, 1537401071, '/code/'),
(72, '5d48fa85c1b37ef71df3958fbeb6fdd9', 0, 'Maksymilian Arciemowicz', 'JAVA Public Static Final Field References Mutable Object', 'A public or protected static final field references a mutable object, which allows the object to be changed by malicious code, or accidentally from another package.\n\nhttps://cwe.mitre.org/data/definitions/607.html', '', 'CWE-607', '', '{\n\"v1\":\"(?<v1>.*public static final (\\\\w+)\\\\[\\\\].*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401072, 1537401072, '/code/'),
(73, 'adfa29c6250ddf95d565dab8e2b1df19', 0, 'Maksymilian Arciemowicz', 'JAVA XPath Injection Java', 'https://wiki.sei.cmu.edu/confluence/display/java/IDS53-J.+Prevent+XPath+Injection', '', 'CWE-643', '', '{\n\"v1\":\"(?<v1>.*XPath (?<v2>\\\\w+)( |)\\\\=( |)(\\\\w+).newXPath.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401073, 1537401073, '/code/'),
(74, 'b3964ce84f09ec4395f9b411b65ee4e5', 0, 'Maksymilian Arciemowicz', 'JAVA Reachable Assertion', '', '', 'CWE-617', '', '{\n\"v1\":\"(?<v1>.*assert (\\\\w+) != null.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401074, 1537401074, '/code/'),
(75, 'a08f7d0f1da4e17476583ee90fb233b8', 0, 'Maksymilian Arciemowicz', 'XXE DocumentBuilderFactory without disallow-doctype-decl Generic', 'This is the PRIMARY defense. If DTDs (doctypes) are disallowed, almost all XML entity attacks are prevented Xerces 2 only. E.g.\n\n       FEATURE = \"http://apache.org/xml/features/disallow-doctype-decl\";\n       dbf.setFeature(FEATURE, true);', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*javax\\\\.xml\\\\.parsers\\\\.DocumentBuilderFactory.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"DocumentBuilderFactory\\\\.newInstance\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"disallow\\\\-doctype\\\\-decl\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401075, 1537442806, '/code/'),
(76, 'a1451ccc2af871e51b3342dd64df64bd', 0, 'Maksymilian Arciemowicz', 'XXE TransformerFactory Generic', 'To protect a javax.xml.transform.TransformerFactory', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*TransformerFactory\\\\.newInstance.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"(XMLConstants\\\\.ACCESS\\\\_EXTERNAL\\\\_STYLESHEET|XMLConstants\\\\.ACCESS\\\\_EXTERNAL\\\\_DTD)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401076, 1537442784, '/code/'),
(77, 'c6e9825fa7ef8bac1450d77b34dceff1', 0, 'Maksymilian Arciemowicz', 'XXE StAX parser Generic', '', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*createXMLStreamReader.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"setProperty\\\\(XMLInputFactory\\\\.SUPPORT\\\\_DTD\\\\, false\\\\)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401077, 1537401077, '/code/'),
(78, '5198df15e5159913ac636f571b232578', 0, 'Maksymilian Arciemowicz', 'XXE SchemaFactory Validator Generic', '', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*SchemaFactory\\\\.newInstance.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"XMLConstants\\\\.ACCESS\\\\_EXTERNAL\\\\_DTD\",\n\"f2\":\"XMLConstants\\\\.ACCESS\\\\_EXTERNAL\\\\_SCHEMA\",\n\"f3\":\"\"\n}', 1537401078, 1537401078, '/code/'),
(79, '949002d33f4d02b8ce3fd195b14f1f17', 0, 'Maksymilian Arciemowicz', 'XXE SAXTransformerFactory Generic', '', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*SAXTransformerFactory\\\\.newInstance.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"XMLConstants\\\\.ACCESS\\\\_EXTERNAL\\\\_DTD\",\n\"f2\":\"XMLConstants\\\\.ACCESS\\\\_EXTERNAL\\\\_STYLESHEET\",\n\"f3\":\"\"\n}', 1537401079, 1537401079, '/code/'),
(80, 'eb780a5ec6eae4d8bc58930f5ca6b4cc', 0, 'Maksymilian Arciemowicz', 'XXE XMLReader Generic', 'To protect a Java org.xml.sax.XMLReader from XXE,', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*XMLReaderFactory\\\\.createXMLReader.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"http\\\\:\\\\/\\\\/apache\\\\.org\\\\/xm\\\\l/features\\\\/disallow\\\\-doctype\\\\-decl\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401080, 1537401080, '/code/'),
(81, 'ab6df20875d66545a330ee84a97bb30d', 0, 'Maksymilian Arciemowicz', 'XXE saxReader Generic', 'To protect a Java org.dom4j.io.SAXReader from XXE', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*SAXReader.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"http\\\\:\\\\/\\\\/apache\\\\.org\\\\/xml\\\\/features\\\\/disallow\\\\-doctype\\\\-decl\",\n\"f2\":\"http\\\\:\\\\/\\\\/xml\\\\.org\\\\/sax\\\\/features\\\\/external\\\\-general\\\\-entities\",\n\"f3\":\"\"\n}', 1537401081, 1537401081, '/code/'),
(82, '663494f13e9f07ed1cafc53f0e1a7756', 0, 'Maksymilian Arciemowicz', 'XXE SAXBuilder Generic', 'To protect a Java org.jdom2.input.SAXBuilder from XXE', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*SAXBuilder.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"http\\\\:\\\\/\\\\/apache\\\\.org\\\\/xml\\\\/features\\\\/disallow\\\\-doctype\\\\-decl\",\n\"f2\":\"http\\\\:\\\\/\\\\/xml\\\\.org\\\\/sax\\\\/features\\\\/external\\\\-general\\\\-entities\",\n\"f3\":\"\"\n}', 1537401082, 1537401082, '/code/'),
(83, '2101284c28863c423d1465f7e136d132', 0, 'Maksymilian Arciemowicz', 'XXE JAXBContext Generic', 'Since a javax.xml.bind.Unmarshaller parses XML and does not support any flags for disabling XXE, it√É¬¢√¢‚Äö¬¨√¢‚Äû¬¢s imperative to parse the untrusted XML through a configurable secure parser first, generate a source object as a result, and pass the source object to the Unmarshaller.', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*JAXBContext\\\\.newInstance.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\".*bind\\\\.Unmarshaller.*\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"external\\\\-general\\\\-entities\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401083, 1537401083, '/code/'),
(84, 'e9b24478f5134c6a7c7ed6e07d7fb5a5', 0, 'Maksymilian Arciemowicz', 'XXE processExternalEntities Generic', 'Generic spring security configuration for jaxb and others', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*processExternalEntities.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401084, 1537442760, '/code/'),
(85, '998b93ed7ce4cdca2db5091489988e33', 0, 'Maksymilian Arciemowicz', 'XXE Potential SAXParserFactory.newInstance Generic', 'https://wiki.sei.cmu.edu/confluence/display/java/IDS17-J.+Prevent+XML+External+Entity+Attacks\n\nPatch:\nX.setFeature(\"http://xml.org/sax/features/external-general-entities\", false);\nX.setFeature(\"http://xml.org/sax/features/external-parameter-entities\", false);', '', 'CWE-611', '', '{\n\"v1\":\"(?<v1>.*SAXParserFactory\\\\.newInstance.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401085, 1537442772, '/code/'),
(86, 'bddceae8989455ee774415338939fb74', 0, 'Maksymilian Arciemowicz', 'JAVA Explicit Call to Finalize()', 'The software makes an explicit call to the finalize() method from outside the finalizer.', '', 'CWE-586', '', '{\n\"v1\":\"(?<v1>.*\\\\.finalize\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"(.*void finalize.*throws Throwable.*)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401086, 1537401086, '/code/'),
(87, '67a313709135c2900b7ad2080ce9f701', 0, 'Maksymilian Arciemowicz', 'JAVA Empty Synchronized Block', '', '', 'CWE-585', '', '{\n\"v1\":\"(?<v1>.*\\\\.synchronized\\\\(this\\\\)( |)\\\\{( |)\\\\}\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"(.*void finalize.*throws Throwable.*)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401087, 1537401087, '/code/'),
(88, '49174ea43bde955b58c061fbaf2d7c64', 0, 'Maksymilian Arciemowicz', 'JAVA Array Declared Public, Final, and Static', 'The program declares an array public, final, and static, which is not sufficient to prevent the array\'s contents from being modified.\n\nhttps://cwe.mitre.org/data/definitions/582.html', '', 'CWE-582', '', '{\n\"v1\":\"(?<v1>.*public final static (\\\\w+)\\\\[\\\\].*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401088, 1537401088, '/code/'),
(89, 'c8221d06bb099ccc0e1838f4f4a90aca', 0, 'Maksymilian Arciemowicz', 'JAVA clone() Method Without super.clone()', '', '', 'CWE-580', '', '{\n\"v1\":\"(?<v1>.*public Object clone.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"(.*super\\\\.clone.*)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401089, 1537401089, '/code/'),
(90, '33e09a52411989730a15b0bccae6c814', 0, 'Maksymilian Arciemowicz', 'JAVA ClassLoaders define classes - arbitrary java code execution', '', '', 'CWE-578', '', '{\n\"v1\":\"(?<v1>.*defineClass(| )\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401090, 1537401090, '/code/'),
(91, 'a1a3db7c67ebfebe6c132a2650c6ffc6', 0, 'Maksymilian Arciemowicz', 'JAVA URLClassLoader define classes - arbitrary java code execution', '', '', 'CWE-578', '', '{\n\"v1\":\"(?<v1>.*URLClassLoader.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401091, 1537401091, '/code/'),
(92, 'c5d6aedee478a9851745527f75172343', 0, 'Maksymilian Arciemowicz', 'JAVA Call to Thread run() instead of start()', 'The program calls a thread\'s run() method instead of calling start(), which causes the code to run in the thread of the caller instead of the callee.', '', 'CWE-572', '', '{\n\"v1\":\"(.*Thread (?<v1>\\\\w+)( |)\\\\=( |)new Thread.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*<v1>\\\\.run.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"(.*<v1>\\\\.start.*)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401092, 1537401092, '/code/'),
(93, 'a8a682be472db8fa03f3eeaa19f544c4', 0, 'Maksymilian Arciemowicz', 'JAVA finalize() Method Without super.finalize()', '', '', 'CWE-568', '', '{\n\"v1\":\"(?<v1>.*void finalize( |)\\\\(\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"(.*super\\\\.finalize.*)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401093, 1537401093, '/code/'),
(94, '2e6866a937ddc3bd1559d459e6168f4c', 0, 'Maksymilian Arciemowicz', 'JAVA Deserialization of Untrusted Data', '', '', 'CWE-502', '', '{\n\"v1\":\"(?<v1>.*new File( |)\\\\(\\\\\\\".*\\\\.obj\\\\\\\"\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*new ObjectInputStream.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401094, 1537401094, '/code/'),
(95, '2cee2f9f01a11fdc1026abd4e534b459', 0, 'Maksymilian Arciemowicz', 'JAVA Public Static Field Not Marked Final', '', '', 'CWE-500', '', '{\n\"v1\":\"(?<v1>.*public static String (\\\\w+)( |)\\\\=( |)\\\\\\\".*\\\\\\\".*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401095, 1537401095, '/code/'),
(96, '6176a5134a90557df0e15efb13a6dadf', 0, 'Maksymilian Arciemowicz', 'JAVA Public Data Assigned to Private Array-Typed Field', '', '', 'CWE-496', '', '{\n\"v1\":\"(.*private String\\\\[\\\\] (?<v1>\\\\w+)\\\\;.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*this\\\\.<v1> \\\\=.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401096, 1537401096, '/code/'),
(97, '560644cfc6e4c1cbda547b25ebcc3251', 0, 'Maksymilian Arciemowicz', 'JAVA Private Array-Typed Field Returned From A Public Method', 'The product has a method that is declared public, but returns a reference to a private array, which could then be modified in unexpected ways.', '', 'CWE-495', '', '{\n\"v1\":\"(.*private String\\\\[\\\\] (?<v1>\\\\w+).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*return <v1>\\\\;.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401097, 1537401097, '/code/'),
(98, '3f0c5e1fdfe59415c75bf9d9c5fb7e7a', 0, 'Maksymilian Arciemowicz', 'JAVA Critical Public Variable Without Final Modifier', '', '', 'CWE-493', '', '{\n\"v1\":\"(?<v1>.*public String (\\\\w+) \\\\= \\\\\\\".*\\\\\\\"\\\\;.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401098, 1537401098, '/code/'),
(99, '427945038afa745411b75e143ff18960', 0, 'Maksymilian Arciemowicz', 'JAVA Public cloneable() Method Without Final (\'Object Hijack\')', '', '', 'CWE-491', '', '{\n\"v1\":\"(?<v1>.*(public|protected) Object clone( |)\\\\(.*\\\\) throws.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401099, 1537401099, '/code/'),
(100, '90d195337319872b3dd5f11eb14e2882', 0, 'Maksymilian Arciemowicz', 'JAVA Comparison of Classes by Name', '', '', 'CWE-486', '', '{\n\"v1\":\"(?<v1>.*\\\\.getClass\\\\(\\\\)\\\\.getName\\\\(\\\\)\\\\.equals\\\\(\\\\\\\".*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401100, 1537401600, '/code/'),
(101, 'c2409833d347da265561dc1192528400', 0, 'Maksymilian Arciemowicz', 'JAVA Assigning instead of Comparing', '', '', 'CWE-481', '', '{\n\"v1\":\"(?<v1>.*if( |)\\\\(.* \\\\= true( |)\\\\) .*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401101, 1537401101, '/code/'),
(102, '97e988c35127c6f5933d6e4efe942574', 0, 'Maksymilian Arciemowicz', 'JAVA Missing Default Case in Switch Statement', '', '', 'CWE-478', '', '{\n\"v1\":\"(?<v1>.*switch( |)\\\\(.*\\\\)(| )\\\\{.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"(.*default\\\\:.*)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401102, 1537401102, '/code/'),
(103, '8a799b77517383d129e21ee717554702', 0, 'Maksymilian Arciemowicz', 'JAVA Use of Externally-Controlled Input to Select Classes or Code', '', '', 'CWE-470', '', '{\n\"v1\":\"(.*Class\\\\.forName( |)\\\\(?<v1>\\\\w+\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*getParameter( |)\\\\(.*<v1>.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401103, 1537401103, '/code/'),
(104, '5662ec212a4f5145e4cebd07cf4394e9', 0, 'Maksymilian Arciemowicz', 'JAVA Load classes from untrusted source - java.beans.Instrospector.getBeanInfo', '', '', 'CWE-470', '', '{\n\"v1\":\"(?<v1>.*getBeanInfo.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401104, 1537401104, '/code/'),
(105, '1f4774b63f23af1bac204a7d7e212e06', 0, 'Maksymilian Arciemowicz', 'JAVA Insufficient Resource Pool', '', '', 'CWE-410', '', '{\n\"v1\":\"(?<v1>.*maxWait\\\\=\\\\\\\".*0000\\\\\\\".*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401105, 1537401105, '/code/'),
(106, 'a09a0b18d9a8a97b02bb261cc95a4625', 0, 'Maksymilian Arciemowicz', 'JAVA Uncontrolled Resource Consumption for (;;)', '', '', 'CWE-400', '', '{\n\"v1\":\"(?<v1>.*for( |)\\\\(\\\\;\\\\;\\\\) \\\\{.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"(.*break\\\\;.*)\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401106, 1537401106, '/code/'),
(107, '81ba66261c184069800e43950acf07f1', 0, 'Maksymilian Arciemowicz', 'JAVA Declaration of Throws for Generic Exception', '', '', 'CWE-397', '', '{\n\"v1\":\"(?<v1>.*throws Exception \\\\{.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401107, 1537401107, '/code/'),
(108, 'ad09b0f984017f7dd8e43c95f05af2c0', 0, 'Maksymilian Arciemowicz', 'JAVA Use of NullPointerException Catch to Detect NULL Pointer Dereference', '', '', 'CWE-395', '', '{\n\"v1\":\"(?<v1>.*\\\\}( |)catch( |)\\\\(( |)NullPointerException( |)npe( |)\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401108, 1537401108, '/code/'),
(109, 'fba607cb87ea6744eb8de71bdda4b940', 0, 'Maksymilian Arciemowicz', 'J2EE Bad Practices: Direct Use of Threads', '', '', 'CWE-383', '', '{\n\"v1\":\"(?<v1>.*HttpServletRequest.*)\",\n\"v2\":\"(?<v2>.*Runnable .*\\\\=( |)new Runnable\\\\(\\\\)( |)\\\\{.*)\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401109, 1537401109, '/code/'),
(110, '00e83ce3ca3fc95e7c906dc6c57ac594', 0, 'Maksymilian Arciemowicz', 'J2EE Bad Practices Use of System.exit', '', '', 'CWE-382', '', '{\n\"v1\":\"(?<v1>.*HttpServletRequest.*)\",\n\"v2\":\"(?<v2>.*System.exit( |)\\\\(.*)\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401110, 1537401110, '/code/'),
(111, '85522b0a22cb7091857a454dbde7f2b3', 0, 'Maksymilian Arciemowicz', 'J2EE Bad Practices Direct Use of Sockets', '', '', 'CWE-246', '', '{\n\"v1\":\"(?<v1>.*HttpServletRequest.*)\",\n\"v2\":\"(?<v2>.*new Socket( |)\\\\(.*)\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401111, 1537401111, '/code/'),
(112, '813d8b79551b50f7c9dccbd6f679cb7d', 0, 'Maksymilian Arciemowicz', 'J2EE Bad Practices Direct Management of Connections', '', '', 'CWE-245', '', '{\n\"v1\":\"(?<v1>.*getConnection( |)\\\\(([a-zA-Z0-9\\\\_]{1,64})\\\\)\\\\;.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401112, 1537401112, '/code/'),
(113, '42a59ff3122d3342be4ae8891f5a088c', 0, 'Maksymilian Arciemowicz', 'JAVA Weak cryptographic algorithm DES', '', '', 'CWE-327', '', '{\n\"v1\":\"(?<v1>.*KeyGenerator\\\\.getInstance\\\\(\\\\\\\"DES\\\\\\\"\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401113, 1537401113, '/code/'),
(114, '2c33f8eb3501fc4472d35c7b774c4af9', 0, 'Maksymilian Arciemowicz', 'JAVA Weak AES Electronic Codebook ECB mode of operation', 'https://wiki.sei.cmu.edu/confluence/display/java/MSC61-J.+Do+not+use+insecure+or+weak+cryptographic+algorithms', '', 'CWE-327', '', '{\n\"v1\":\"(?<v1>.*Cipher\\\\.getInstance\\\\(\\\\\\\"AES\\\\\\\"\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401114, 1537443428, '/code/');
INSERT INTO `cifrex_filters` (`filtr_id`, `filtr_hash`, `regexdb_id`, `author`, `name`, `description`, `cve`, `cwe`, `wlb`, `filtr`, `date_created`, `date_lastmod`, `qs_lastused_path`) VALUES
(115, '00a1e2806beac7f090dd10fd3af68e06', 0, 'Maksymilian Arciemowicz', 'JAVA Weak AES Electronic Codebook ECB Algorithm (Potential)', 'https://wiki.sei.cmu.edu/confluence/display/java/MSC61-J.+Do+not+use+insecure+or+weak+cryptographic+algorithms', '', 'CWE-327', '', '{\n\"v1\":\"(?<v1>.*Cipher\\\\.getInstance\\\\((?<v2>[a-zA-Z0-9_]{1,64})\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*\\\\\\\"AES\\\\\\\".*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\".*PKCS5Padding.*\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401115, 1537401115, '/code/'),
(116, '18e1104a2c823ee5487351a9dc4d1609', 0, 'Maksymilian Arciemowicz', 'JAVA Weak SecureRandom entropy', '', '', 'CWE-327', '', '{\n\"v1\":\"(?<v1>.*new secureRandom\\\\(.*\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401116, 1537401116, '/code/'),
(117, 'df12c10ef87922d732e172abd33afb3d', 0, 'Maksymilian Arciemowicz', 'JAVA Weak SSL protocols SSLv3 TLSv1 TLSv1.1', 'Disable weak protocols', '', 'CWE-327', '', '{\n\"v1\":\"(?<v1>.*(SSLv3|TLSv1\\\\\\\"|TLSv1\\\\.1).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401117, 1537401117, '/code/'),
(118, '132c68ba9fa34b7338fc4c3268639c82', 0, 'Maksymilian Arciemowicz', 'JAVA Cleartext Transmission of Sensitive Information', '', '', 'CWE-319', '', '{\n\"v1\":\"(?<v1>.*new URL( |)\\\\(\\\\\\\"http\\\\:\\\\/.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401118, 1537401118, '/code/'),
(119, 'ae837235b516914724346bfe0f6eff13', 0, 'Maksymilian Arciemowicz', 'JAVA Cleartext Transmission of Sensitive Information though filed', '', '', 'CWE-319', '', '{\n\"v1\":\"(.*new URL( |)\\\\((?<v1>\\\\w+)\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*<v1>.*\\\\=( |)\\\\\\\"http\\\\:\\\\/\\\\/.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401119, 1537401119, '/code/'),
(120, 'c6bd6dbf392a21d8e76fa80442b6a484', 0, 'Maksymilian Arciemowicz', 'JAVA Password Plaintext Storage through Properties', '', '', 'CWE-312', '', '{\n\"v1\":\"(Properties (?<v1>\\\\w+).*\\\\=.*new Properties.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"(.*<v1>.*password.*)\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401120, 1537401120, '/code/'),
(121, '89a89c7012a1280263f751af2418e82e', 0, 'Maksymilian Arciemowicz', 'JAVA Improper Neutralization of Special Elements used in an OS Command', '', '', 'CWE-78', '', '{\n\"v1\":\"(?<v1>.*System\\\\.exec( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401121, 1537401121, '/code/'),
(122, 'f332be6732161ff1c7e76eb0f43a6787', 0, 'Maksymilian Arciemowicz', 'JAVA Incorrect Behavior Order Validate Before Canonicalize', '', '', 'CWE-180', '', '{\n\"v1\":\"(?<v1>.*(\\\\w+)\\\\.startsWith( |)\\\\(\\\\\\\"\\\\/.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401122, 1537401122, '/code/'),
(123, '436c00efbae922a8beb0f26762efcfbe', 0, 'Maksymilian Arciemowicz', 'JAVA System.load - Loading native libraries', '', '', 'CWE-114', '', '{\n\"v1\":\"(?<v1>.*System\\\\.(load|loadLibrary)( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401123, 1537401123, '/code/'),
(124, 'a43de6a5a18142b5073257d5c3eb311f', 0, 'Maksymilian Arciemowicz', 'JAVA Arbitrary code execution - javax.script.ScriptEngine.eval', 'javax.script.ScriptEngine.eval', '', 'CWE-94', '', '{\n\"v1\":\"(?<v1>.*ScriptEngine.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401124, 1537401124, '/code/'),
(125, '597e3b41f01c658d2a51ef0d64a4a65e', 0, 'Maksymilian Arciemowicz', 'JAVA ScriptEngine Code injection through eval', 'https://wiki.sei.cmu.edu/confluence/display/java/IDS52-J.+Prevent+code+injection', '', 'CWE-94', '', '{\n\"v1\":\"(?<v1>.*eval.*)\",\n\"v2\":\"ScriptEngine\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401125, 1537401125, '/code/'),
(126, 'dc63a47d1fdb642c2b1bd6b372127833', 0, 'Maksymilian Arciemowicz', 'JAVA Generic Java SQL Injection', '', '', 'CWE-89', '', '{\n\"v1\":\"(?<v1>.*(AND|WHERE).*\\\\=( |)\\\\\'\\\\\\\"( |)\\\\+.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401126, 1537401126, '/code/'),
(127, '9301a74da1365728930777ac8a583271', 0, 'Maksymilian Arciemowicz', 'JAVA XSS StringEscapeUtils Generic fix', 'To check other inputs', '', 'CWE-79', '', '{\n\"v1\":\"(?<v1>.*StringEscapeUtils.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401127, 1537401127, '/code/'),
(128, '14494cb22186ff978b9bebf75a20324c', 0, 'Maksymilian Arciemowicz', 'JAVA XSS JSP through request.get', 'E.g. request.getHeader', '', 'CWE-79', '', '{\n\"v1\":\"(?<v1>.*\\\\<\\\\%\\\\=( |)request.get.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401128, 1537401128, '/code/'),
(129, '40b3d6647d009a84366e0d0b98cc6676', 0, 'Maksymilian Arciemowicz', 'JAVA XSS JSTL without escapeXml', 'Some places have not declared escapeXml', '', 'CWE-79', '', '{\n\"v1\":\"(?<v1>.*\\\\$\\\\{( |)\\\\w+( |)\\\\}\\\".*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"escapeXml\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401129, 1537401129, '/code/'),
(130, 'cdea35c832647c7b4664181a9d0aee97', 0, 'Maksymilian Arciemowicz', 'JAVA XSS JSTL escapeXml false', '', '', 'CWE-79', '', '{\n\"v1\":\"(?<v1>.*escapeXml\\\\=\\\\\\\"false\\\\\\\".*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401130, 1537401130, '/code/'),
(131, '353ec771168bf8fab486a36fdbbe6a9d', 0, 'Maksymilian Arciemowicz', 'JAVA XSS Unified EL param', '', '', 'CWE-79', '', '{\n\"v1\":\"(?<v1>.*\\\\$\\\\{param\\\\.(\\\\w+)\\\\}.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401131, 1537401131, '/code/'),
(132, '6b9b186796f2193d4b7ab93beeac3d54', 0, 'Maksymilian Arciemowicz', 'JAVA XSS Unified EL header', '', '', 'CWE-79', '', '{\n\"v1\":\"(?<v1>.*\\\\$\\\\{header(\\\\w+)\\\\}.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401132, 1537401132, '/code/'),
(133, 'eda6a5f60cc642902795d1fa0ea9dd55', 0, 'Maksymilian Arciemowicz', 'JAVA XSS Unified EL requestScope', 'requestScope\n\nMaps request-scoped variable names to their values.\nLooks exactly the same as pageScope.', '', 'CWE-79', '', '{\n\"v1\":\"(?<v1>.*\\\\$\\\\{requestScope.*\\\\}.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401133, 1537401133, '/code/'),
(134, '7bf9be60a37fa37b29f49ccd0a6f78dc', 0, 'Maksymilian Arciemowicz', 'JAVA ProcessBuilder constructor - Potential command injection', '', '', 'CWE-78', '', '{\n\"v1\":\"(?<v1>.*new ProcessBuilder( |)\\\\(.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1537401134, 1537401134, '/code/'),
(135, '043a6d811f232f7991b40bb8c0bc30a0', 0, 'Maksymilian Arciemowicz', 'JAVA WebSecurityConfig directive', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*WebSecurityConfig.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1605992937, 1605995066, '/code/'),
(136, '8da00d146809b680c62dccc23a6c7257', 0, 'Maksymilian Arciemowicz', 'JAVA escape false potential XSS', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*escape( |)\\\\=( |)\\\\\\\"false\\\\\\\".*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1605995041, 1605995056, '/code/'),
(137, '05e0df08c19ad54498f4417440471277', 0, 'Maksymilian Arciemowicz', 'JAVA Weak random nextInt', 'https://wiki.sei.cmu.edu/confluence/display/java/MSC02-J.+Generate+strong+random+numbers', '', 'CWE-330', '', '{\n\"v1\":\"int (?<v1>\\\\w+)(\\\\;|\\\\=| \\\\=)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\".*<v1>\\\\.nextInt.*\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1605998390, 1605998412, '/code/'),
(138, 'aff9749b9d50686cd1b02695453e04e6', 0, 'undefined', 'JAVA Cleartext Storage of IP Address Information', 'https://wiki.sei.cmu.edu/confluence/display/java/MSC03-J.+Never+hard+code+sensitive+information', '', 'CWE-312', '', '{\n\"v1\":\"(.*(\\\\/\\\\/|\\\\\\\"|\\\\\'([0-9]|[0-9][0-9]|[1-2][0-9][0-9])\\\\.([0-9]|[0-9][0-9]|[1-2][0-9][0-9])\\\\.([0-9]|[0-9][0-9]|[1-2][0-9][0-9])\\\\.([0-9]|[0-9][0-9]|[1-2][0-9][0-9]).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1605998544, 1605998544, '/code/'),
(139, 'a47c455376619dc591031d873f49b34c', 0, 'Maksymilian Arciemowicz', 'JAVA Use of Hard-coded JDBC Password', '', '', 'CWE-259', '', '{\n\"v1\":\"(?<v1>.*(\\\\\\\"|\\\\\')jdbc\\\\:(oracle|mysql).*password.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1605998652, 1605998652, '/code/'),
(140, '67f6ac87553b7a7d7ffe58be08277962', 0, 'Maksymilian Arciemowicz', 'JAVA Use of Hard-coded getConnection Password', '', '', 'CWE-259', '', '{\n\"v1\":\"(?<v1>.*\\\\.getConnection(.*, (\\\\\\\"|\\\\\').*(\\\\\\\"|\\\\\')\\\\, (\\\\\\\"|\\\\\').*(\\\\\\\"|\\\\\')\\\\).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1605998732, 1605998732, '/code/'),
(141, 'a35cf7b916964513daf66794de596a47', 0, 'Maksymilian Arciemowicz', 'JAVA getRuntime use', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*Runtime\\\\.getRuntime.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1605998813, 1605998864, '/code/'),
(142, '762e148231c2741c61d452de3584c13c', 0, 'Maksymilian Arciemowicz', 'GENERIC potential password in plaintext', '', '', 'CWE-259', '', '{\n\"v1\":\"(?<v1>.*([a-zA-Z0-9\\\\.\\\\_])(password|PASSWORD|secret|SECRET)( |)\\\\=(?<v2>( |)(\\\\\\\"|\\\\\'|).*(\\\\\\\"|\\\\\'|))$)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1605998946, 1605998946, '/'),
(143, '62d66365f5c864b56127e6b435cb933d', 0, 'Maksymilian Arciemowicz', 'GENERIC host hard coded', 'https://wiki.sei.cmu.edu/confluence/display/java/MSC03-J.+Never+hard+code+sensitive+information', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*([a-zA-Z0-9\\\\.\\\\_])(host|HOST)( |)\\\\=(?<v2>( |)(\\\\\\\"|\\\\\'|).*(\\\\\\\"|\\\\\'|))$)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606033594, 1606033610, '/code/'),
(144, '959c43419672a042c550195f5835bd7a', 0, 'Maksymilian Arciemowicz', 'GENERIC http https URL address', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*http(s)?\\\\:\\\\/\\\\/.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606033720, 1606033720, '/code/'),
(145, 'b1203163557176d53505377963847eec', 0, 'Maksymilian Arciemowicz', 'GENERIC Cleartext Storage of private key', '', '', 'CWE-312', '', '{\n\"v1\":\"(?<v1>.*PRIVATE KEY.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606033800, 1606033800, '/code/'),
(146, '69959d256ec7ef3ec8fb57c78c425105', 0, 'Maksymilian Arciemowicz', 'GENERIC Internal 10 IP Address Hard Coded', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*(10\\\\.([0-9]|[0-9][0-9]|[1-2][0-9][0-9])\\\\.([0-9]|[0-9][0-9]|[1-2][0-9][0-9])\\\\.([0-9]|[0-9][0-9]|[1-2][0-9][0-9]).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606033884, 1606034002, '/code/'),
(147, '08e8bbc5bd071614b350a2e979649420', 0, 'Maksymilian Arciemowicz', 'GENERIC Internal 192.168 IP Address Hard Coded', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*(192\\\\.168\\\\.([0-9]|[0-9][0-9]|[1-2][0-9][0-9])\\\\.([0-9]|[0-9][0-9]|[1-2][0-9][0-9]).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606033929, 1606033929, '/'),
(148, 'f1f02b23267135569064bed2749f3fc4', 0, 'Maksymilian Arciemowicz', 'GENERIC Potentail email address', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*([a-zA-Z0-9\\\\.\\\\_\\\\-]{1,32}\\\\@[a-zA-Z0-9\\\\.\\\\_\\\\-]{1,32}.[a-zA-Z]{2,12}.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606034044, 1606034044, '/code/'),
(149, 'd560a5fe2ad25fbfca5b03a08b01484d', 0, 'Maksymilian Arciemowicz', 'GENERIC Potential mongolab credentials', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*mongolab\\\\.com.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606034086, 1606034086, '/code/'),
(150, 'c739f64fabb16dc343e89104823be912', 0, 'Maksymilian Arciemowicz', 'GENERIC Potentail DB credentials', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*DB\\\\_USERNAME.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606034138, 1606034330, '/code/'),
(151, '622dbba9adfe9f5f5ea53a6097d05e9c', 0, 'Maksymilian Arciemowicz', 'GENERIC Potential MAIL_HOST', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*MAIL\\\\_HOST.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606034199, 1606034199, '/code/'),
(152, '93e791fedf06136fb4a1665638fc92e1', 0, 'Maksymilian Arciemowicz', 'GENERIC Potential SECRET_KEY', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*SECRET\\\\_KEY.*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606034243, 1606034243, '/'),
(153, 'bd3f201d631c19fc8f7702de8b273d58', 0, 'Maksymilian Arciemowicz', 'JAVA Potential regex usage', '', '', 'CWE-OTHER', '', '{\n\"v1\":\"(?<v1>.*Pattern\\\\.compile( |)\\\\(.*(\\\\+(| )\\\\\\\"|\\\\\\\"(| )\\\\+).*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606034299, 1606034299, '/code/'),
(154, 'a00d8df6923ed82b5622a8d9052d3896', 0, 'Maksymilian Arciemowicz', 'JAVA Potential keystore password', '', 'CWE-312', '', '', '{\n\"v1\":\"(?<v1>.*keystore\\\\-password( |)\\\\=( |)\\\\\\\".*)\",\n\"v2\":\"\",\n\"v3\":\"\",\n\"t1\":\"\",\n\"t2\":\"\",\n\"t3\":\"\",\n\"f1\":\"\",\n\"f2\":\"\",\n\"f3\":\"\"\n}', 1606034399, 1606034399, '/code/');

-- --------------------------------------------------------

--
-- Table structure for table `cifrex_groups`
--

CREATE TABLE `cifrex_groups` (
  `group_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `path` varchar(4096) NOT NULL,
  `source` text NOT NULL,
  `custom_files` text NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_lastmod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cifrex_groups`
--

INSERT INTO `cifrex_groups` (`group_id`, `name`, `description`, `path`, `source`, `custom_files`, `date_created`, `date_lastmod`) VALUES
(1, 'CPC - Classic Patterns for C', 'C language', '/code/', '', 'c', 1492119302, 1492119358),
(2, 'PCDF -  PHP Classic Dangerous Functions', 'Common group of dangerous functions in PHP', '/code/', '', 'php', 1491759452, 1492115748),
(4, 'JCV - Java Classic Vulnerabilities', 'All JAVA vulnerabilities', '/code/', '', 'java', 1536749732, 1536749745),
(5, 'JCWE - JAVA CWE All', 'CWE Compatible pattens', '/code/', '', 'java|jsp|xml', 1537309151, 1537309151),
(6, 'JOW - JAVA OWASP TOP 10', 'OWASP TOP10 for JAVA', '/code/', '', 'java|jsp|xml', 1537309248, 1537309248),
(7, 'JXSS - JAVA Cross site scripting', 'Classic XSS vulnerability in JAAVA', '/code/', '', 'java|jsp|xml', 1537309283, 1537309283),
(8, 'JXXE - JAVA XXE Vulnerability', 'Common XXE patterns for JAVA', '/code/', '', 'java|jsp|xml', 1537309310, 1537309310),
(9, 'JCRY - JAVA CRYPTO Weaknesses', 'DES, TLS 1.0 and other weak algorithms', '/code/', '', 'java|jsp|xml', 1537309479, 1537309479),
(10, 'JSPR - JAVA Spring for manual review', 'Help perform manual static code review for spring project', '/code/', '', 'java|jsp|xml', 1537309540, 1537309540),
(11, 'JOTH - JAVA INFO Audit', 'Help perform manual static code review for java projects', '/code/', '', 'java|jsp|xml', 1537309840, 1537309840),
(12, 'GENERIC - Sensitive Information', 'Sensitive Information', '/code/', '', '*', 1606035441, 1606035464);

-- --------------------------------------------------------

--
-- Table structure for table `cifrex_languages`
--

CREATE TABLE `cifrex_languages` (
  `lang_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `files` text NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_lastmod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cifrex_languages`
--

INSERT INTO `cifrex_languages` (`lang_id`, `name`, `description`, `files`, `date_created`, `date_lastmod`) VALUES
(1, 'C', 'Common weaknesses for C', 'c|h', 1422041351, 1422041351),
(2, 'C++', 'Common weaknesses for C++', 'cc|cpp|hpp|hh', 1422041379, 1422041920),
(3, 'PHP', 'Common weaknesses for PHP scripts', 'php|php4', 1422041468, 1422041468),
(4, 'JAVA', 'Common weaknesses for JAVA', 'java|jsp|xml', 1422041637, 1536778546),
(5, 'Perl', 'Common weaknesses for Perl', 'pl', 1422042131, 1422042131),
(6, 'Python', 'Common weaknesses for Python', 'py', 1422042151, 1422042151),
(7, 'HTML', 'Common weaknesses for HTML', 'htm|html', 1422042173, 1492119393),
(8, 'JavaScript', 'Common weaknesses for Java Script', 'js', 1422042193, 1422299038),
(9, 'Default', 'All files', '*', 1422041350, 1422041350),
(10, 'CI/CD', 'Common filters for CI/CD tools like Jenkins', 'Jenkinsfile', 1606035594, 1606035594);

-- --------------------------------------------------------

--
-- Table structure for table `cifrex_relation_fil_gro`
--

CREATE TABLE `cifrex_relation_fil_gro` (
  `relation_fg` int(11) NOT NULL,
  `filtr_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cifrex_relation_fil_gro`
--

INSERT INTO `cifrex_relation_fil_gro` (`relation_fg`, `filtr_id`, `group_id`) VALUES
(1, 64, 4),
(2, 65, 4),
(3, 66, 4),
(4, 67, 4),
(5, 68, 4),
(6, 70, 4),
(7, 71, 4),
(8, 72, 4),
(9, 73, 4),
(10, 74, 4),
(11, 86, 4),
(12, 87, 4),
(13, 88, 4),
(14, 89, 4),
(15, 90, 4),
(16, 91, 4),
(17, 92, 4),
(18, 93, 4),
(19, 94, 4),
(20, 95, 4),
(21, 96, 4),
(22, 97, 4),
(23, 98, 4),
(24, 99, 4),
(25, 100, 4),
(26, 101, 4),
(27, 102, 4),
(28, 103, 4),
(29, 104, 4),
(30, 105, 4),
(31, 106, 4),
(32, 107, 4),
(33, 108, 4),
(34, 113, 4),
(35, 114, 4),
(36, 115, 4),
(37, 116, 4),
(38, 117, 4),
(39, 118, 4),
(40, 119, 4),
(41, 120, 4),
(42, 121, 4),
(43, 122, 4),
(44, 123, 4),
(45, 124, 4),
(46, 125, 4),
(47, 126, 4),
(48, 127, 4),
(49, 128, 4),
(50, 129, 4),
(51, 130, 4),
(52, 131, 4),
(53, 132, 4),
(54, 133, 4),
(55, 134, 4),
(56, 51, 4),
(57, 52, 4),
(58, 53, 4),
(59, 54, 4),
(60, 55, 4),
(61, 56, 4),
(62, 57, 4),
(63, 58, 4),
(64, 59, 4),
(65, 60, 4),
(66, 61, 4),
(67, 62, 4),
(68, 63, 4),
(69, 69, 4),
(70, 75, 4),
(71, 76, 4),
(72, 77, 4),
(73, 78, 4),
(74, 79, 4),
(75, 80, 4),
(76, 81, 4),
(77, 82, 4),
(78, 83, 4),
(79, 84, 4),
(80, 85, 4),
(81, 109, 4),
(82, 110, 4),
(83, 111, 4),
(84, 112, 4),
(85, 75, 8),
(86, 76, 8),
(87, 77, 8),
(88, 78, 8),
(89, 79, 8),
(90, 80, 8),
(91, 81, 8),
(92, 82, 8),
(93, 83, 8),
(94, 84, 8),
(95, 85, 8),
(96, 7, 1),
(97, 8, 1),
(98, 9, 1),
(99, 10, 1),
(100, 11, 1),
(101, 1, 2),
(102, 2, 2),
(103, 3, 2),
(104, 4, 2),
(105, 5, 2),
(106, 6, 2),
(107, 12, 2),
(108, 13, 2),
(109, 14, 2),
(110, 15, 2),
(111, 16, 2),
(112, 17, 2),
(113, 18, 2),
(114, 19, 2),
(115, 20, 2),
(116, 21, 2),
(117, 22, 2),
(118, 23, 2),
(119, 24, 2),
(120, 25, 2),
(121, 26, 2),
(122, 27, 2),
(123, 28, 2),
(124, 29, 2),
(125, 30, 2),
(126, 31, 2),
(127, 32, 2),
(128, 33, 2),
(129, 34, 2),
(130, 35, 2),
(131, 36, 2),
(132, 37, 2),
(133, 38, 2),
(134, 39, 2),
(135, 40, 2),
(136, 41, 2),
(137, 42, 2),
(138, 43, 2),
(139, 44, 2),
(140, 45, 2),
(141, 46, 2),
(142, 47, 2),
(143, 48, 2),
(144, 49, 2),
(145, 50, 2),
(146, 69, 5),
(147, 71, 5),
(148, 72, 5),
(149, 86, 5),
(150, 87, 5),
(151, 88, 5),
(152, 89, 5),
(153, 90, 5),
(154, 91, 5),
(155, 92, 5),
(156, 93, 5),
(157, 94, 5),
(158, 95, 5),
(159, 96, 5),
(160, 97, 5),
(161, 98, 5),
(162, 99, 5),
(163, 100, 5),
(164, 101, 5),
(165, 102, 5),
(166, 103, 5),
(167, 104, 5),
(168, 105, 5),
(169, 106, 5),
(170, 107, 5),
(171, 108, 5),
(172, 109, 5),
(173, 110, 5),
(174, 111, 5),
(175, 112, 5),
(176, 121, 5),
(177, 122, 5),
(178, 123, 5),
(179, 124, 5),
(180, 125, 5),
(181, 73, 6),
(182, 75, 6),
(183, 76, 6),
(184, 77, 6),
(185, 78, 6),
(186, 79, 6),
(187, 80, 6),
(188, 81, 6),
(189, 82, 6),
(190, 83, 6),
(191, 84, 6),
(192, 85, 6),
(193, 94, 6),
(194, 113, 6),
(195, 114, 6),
(196, 115, 6),
(197, 117, 6),
(198, 118, 6),
(199, 119, 6),
(200, 120, 6),
(201, 121, 6),
(202, 124, 6),
(203, 125, 6),
(204, 126, 6),
(205, 127, 6),
(206, 128, 6),
(207, 129, 6),
(208, 130, 6),
(209, 131, 6),
(210, 132, 6),
(211, 133, 6),
(212, 134, 6),
(213, 127, 7),
(214, 128, 7),
(215, 129, 7),
(216, 130, 7),
(217, 131, 7),
(218, 132, 7),
(219, 133, 7),
(220, 113, 9),
(221, 114, 9),
(222, 115, 9),
(223, 116, 9),
(224, 117, 9),
(225, 51, 10),
(226, 52, 10),
(227, 53, 10),
(228, 54, 10),
(229, 55, 10),
(230, 56, 10),
(231, 57, 10),
(232, 58, 10),
(233, 59, 10),
(234, 60, 10),
(235, 61, 10),
(236, 62, 10),
(237, 63, 11),
(238, 64, 11),
(239, 65, 11),
(240, 66, 11),
(241, 67, 11),
(242, 135, 11),
(243, 136, 7),
(244, 137, 5),
(245, 138, 5),
(246, 139, 5),
(247, 140, 4),
(248, 141, 5),
(249, 153, 11),
(250, 154, 5),
(251, 142, 12),
(252, 143, 12),
(253, 144, 12),
(254, 145, 12),
(255, 146, 12),
(256, 147, 12),
(257, 148, 12),
(258, 149, 12),
(259, 150, 12),
(260, 151, 12),
(261, 152, 12);

-- --------------------------------------------------------

--
-- Table structure for table `cifrex_relation_lang_fil`
--

CREATE TABLE `cifrex_relation_lang_fil` (
  `relation_fl` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `filtr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cifrex_relation_lang_fil`
--

INSERT INTO `cifrex_relation_lang_fil` (`relation_fl`, `lang_id`, `filtr_id`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 3, 15),
(16, 3, 16),
(17, 3, 17),
(18, 3, 18),
(19, 3, 19),
(20, 3, 20),
(21, 3, 21),
(22, 3, 22),
(23, 3, 23),
(24, 3, 24),
(25, 3, 25),
(26, 3, 26),
(27, 3, 27),
(28, 3, 28),
(29, 3, 29),
(30, 3, 30),
(31, 3, 31),
(32, 3, 32),
(33, 3, 33),
(34, 3, 34),
(35, 3, 35),
(36, 3, 36),
(37, 3, 37),
(38, 3, 38),
(39, 3, 39),
(40, 3, 40),
(41, 3, 41),
(42, 3, 42),
(43, 3, 43),
(44, 3, 44),
(45, 3, 45),
(46, 3, 46),
(47, 3, 47),
(48, 3, 48),
(49, 3, 49),
(50, 3, 50),
(51, 4, 51),
(52, 4, 52),
(53, 4, 53),
(54, 4, 54),
(55, 4, 55),
(56, 4, 56),
(57, 4, 57),
(58, 4, 58),
(59, 4, 59),
(60, 4, 60),
(61, 4, 61),
(62, 4, 62),
(63, 4, 63),
(64, 4, 64),
(65, 4, 65),
(66, 4, 66),
(67, 4, 67),
(68, 4, 68),
(69, 4, 69),
(70, 4, 70),
(71, 4, 71),
(72, 4, 72),
(73, 4, 73),
(74, 4, 74),
(75, 4, 75),
(76, 4, 76),
(77, 4, 77),
(78, 4, 78),
(79, 4, 79),
(80, 4, 80),
(81, 4, 81),
(82, 4, 82),
(83, 4, 83),
(84, 4, 84),
(85, 4, 85),
(86, 4, 86),
(87, 4, 87),
(88, 4, 88),
(89, 4, 89),
(90, 4, 90),
(91, 4, 91),
(92, 4, 92),
(93, 4, 93),
(94, 4, 94),
(95, 4, 95),
(96, 4, 96),
(97, 4, 97),
(98, 4, 98),
(99, 4, 99),
(100, 4, 100),
(101, 4, 101),
(102, 4, 102),
(103, 4, 103),
(104, 4, 104),
(105, 4, 105),
(106, 4, 106),
(107, 4, 107),
(108, 4, 108),
(109, 4, 109),
(110, 4, 110),
(111, 4, 111),
(112, 4, 112),
(113, 4, 113),
(114, 4, 114),
(115, 4, 115),
(116, 4, 116),
(117, 4, 117),
(118, 4, 118),
(119, 4, 119),
(120, 4, 120),
(121, 4, 121),
(122, 4, 122),
(123, 4, 123),
(124, 4, 124),
(125, 4, 125),
(126, 4, 126),
(127, 4, 127),
(128, 4, 128),
(129, 4, 129),
(130, 4, 130),
(131, 4, 131),
(132, 4, 132),
(133, 4, 133),
(134, 4, 134),
(135, 4, 135),
(136, 4, 136),
(137, 4, 137),
(138, 4, 138),
(139, 4, 139),
(140, 4, 140),
(141, 4, 141),
(142, 9, 142),
(143, 9, 143),
(144, 9, 144),
(145, 9, 145),
(146, 9, 146),
(147, 9, 147),
(148, 9, 148),
(149, 9, 149),
(150, 9, 150),
(151, 9, 151),
(152, 9, 152),
(153, 4, 153),
(154, 4, 154);

-- --------------------------------------------------------

--
-- Table structure for table `cifrex_results`
--

CREATE TABLE `cifrex_results` (
  `result_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` int(11) NOT NULL,
  `path` text NOT NULL,
  `files` text NOT NULL,
  `filtr` text NOT NULL,
  `hasz` varchar(64) NOT NULL,
  `credit` text NOT NULL,
  `count_result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cifrex_results_details`
--

CREATE TABLE `cifrex_results_details` (
  `result_id` int(11) NOT NULL,
  `result` longtext NOT NULL,
  `debug_log` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cifrex_filters`
--
ALTER TABLE `cifrex_filters`
  ADD PRIMARY KEY (`filtr_id`),
  ADD KEY `filtr_id` (`filtr_id`),
  ADD KEY `filtr_id_2` (`filtr_id`);

--
-- Indexes for table `cifrex_groups`
--
ALTER TABLE `cifrex_groups`
  ADD UNIQUE KEY `group_id` (`group_id`);

--
-- Indexes for table `cifrex_languages`
--
ALTER TABLE `cifrex_languages`
  ADD UNIQUE KEY `lang_id` (`lang_id`);

--
-- Indexes for table `cifrex_relation_fil_gro`
--
ALTER TABLE `cifrex_relation_fil_gro`
  ADD UNIQUE KEY `relation_fg` (`relation_fg`),
  ADD KEY `relation_fg_2` (`relation_fg`),
  ADD KEY `filtr_id` (`filtr_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `filtr_id_2` (`filtr_id`),
  ADD KEY `relation_fg_3` (`relation_fg`);

--
-- Indexes for table `cifrex_relation_lang_fil`
--
ALTER TABLE `cifrex_relation_lang_fil`
  ADD PRIMARY KEY (`relation_fl`),
  ADD KEY `filtr_id` (`filtr_id`),
  ADD KEY `relation_fl` (`relation_fl`);

--
-- Indexes for table `cifrex_results`
--
ALTER TABLE `cifrex_results`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `cifrex_results_details`
--
ALTER TABLE `cifrex_results_details`
  ADD UNIQUE KEY `result_id` (`result_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cifrex_filters`
--
ALTER TABLE `cifrex_filters`
  MODIFY `filtr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `cifrex_groups`
--
ALTER TABLE `cifrex_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cifrex_languages`
--
ALTER TABLE `cifrex_languages`
  MODIFY `lang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cifrex_relation_fil_gro`
--
ALTER TABLE `cifrex_relation_fil_gro`
  MODIFY `relation_fg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `cifrex_relation_lang_fil`
--
ALTER TABLE `cifrex_relation_lang_fil`
  MODIFY `relation_fl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `cifrex_results`
--
ALTER TABLE `cifrex_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
