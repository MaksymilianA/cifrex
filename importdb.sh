#!/bin/bash
echo " <> CREATING DATABASE"
mysql --defaults-file=`pwd`/config/mariadb/.my.cnf -u root < ./src/DATABASE.sql
sleep 2;
FILE="./DBDumps/latest.sql"
if [ -f $FILE ]; then
   mysql --defaults-file=`pwd`/config/mariadb/.my.cnf -u root cifrex_prod < ./DBDumps/latest.sql
else
    echo ">>> Initial DataBase loaded <<<\n"
fi
sleep 2;
