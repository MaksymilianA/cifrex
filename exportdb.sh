#!/bin/sh
FILE="dump`date +'%m%d%y.%H%M.db.sql'`"
mysqldump --defaults-file=`pwd`/config/mariadb/.my.cnf -u root cifrex_prod > ./DBDumps/latest.sql
cp ./DBDumps/latest.sql ./DBDumps/$FILE
printf "\n Database exported to file ./DBDumps/$FILE\n";
