#!/bin/bash
########################################
################ CONFIG ################
########################################
source ./CONFIGURE

printf "\n=========================================================\n";
printf "==== cIFrex - Regular Expression Static Code Analysis ===\n";
printf "=========================================================\n";
printf "=========================================================\n\n";
printf "=========================================================\n";
printf "> Checking the configuration ============================\n";
printf "=========================================================\n";


if docker --version 2>/dev/null; then
     printf " + Docker found!\n";
else
     printf " >>> ERROR: docker command not found. Install docker first.\n\n"; exit 1;
fi

if mysql --version 2>/dev/null; then
     printf " + mysql command found!\n";
else
     printf " >>> ERROR: mysql command not found. Install mariaDB client on host.\nCENTOS FIX: yum install mariadb\nUBUNTU FIX: apt-get install mysql-client\n\n"; exit 1;
fi

if mysqldump --version 2>/dev/null; then
     printf " + mysqldump command found!\n";
else
     printf " >>> ERROR: mysql command not found. Install mariaDB client on host.\nCENTOS FIX: yum install mariadb\n\n"; exit 1;
fi

if docker ps -a 2>/dev/null; then
     printf " + dockerd ps success.\n";
else
     printf " >>> ERROR: dockerd not working? Check docker status\n\n"; exit 1;
fi

    
printf "[client]\n \
password=\"$DB_ROOT_PASS\"\n \
host=\"$IP_DB\"\n \
port=\"$PORT_DB\"\n \
\n\
[mysqldump]\n \
password=\"$DB_ROOT_PASS\"\n \
host=\"$IP_DB\"\n \
port=\"$PORT_DB\"\n" > config/mariadb/.my.cnf

printf "<?php\n \
    \$cconfig['db_config']['host']=\"cifrexdb\";\n \
    \$cconfig['db_config']['database']=\"cifrex_prod\";\n \
    \$cconfig['db_config']['login']=\"root\";\n \
    \$cconfig['db_config']['password']=\"$DB_ROOT_PASS\";\n \
?>" > src/config.db.php

printf "<?php\n\
    \$url_config = \"http://$IP_HTTP:$PORT_HTTP/\"; // URL of cifrex\n\
    \$dir_config = \"/var/www/web/\"; // Full path to cifrex \n\
?>" > src/config.url.php

printf "#!/bin/sh\n\
sh /etc/lighttpd/htpasswd.sh $HTTP_USER cifrexauth $HTTP_PASS > /etc/lighttpd/.htpasswd\n" > config/lighttpd/createcredentails.sh

printf "\n=========================================================\n";
printf "> Checking the docker and stop&rm =======================\n";
printf "=========================================================\n";

DOCKER_PS=$(docker ps -a -q -f name=cifrexdb)
if [ -n "$DOCKER_PS" ]; then
    printf "\n\nERROR: cIFrex already installed\n\n"
    exit;
fi

printf "\n=========================================================\n";
printf "> Building docker =======================================\n";
printf "=========================================================\n";

docker build -t cifrex .

ADDPARAM=""
if [ "$USE_DOCKER_DB" = true ] ; then
printf "\n=========================================================\n";
printf "> Starting mariaDB container ============================\n";
printf "=========================================================\n";
    docker run --name cifrexdb -p $IP_DB:$PORT_DB:3306 -e MYSQL_ROOT_PASSWORD=$DB_ROOT_PASS -d mariadb:latest
    ADDPARAM=" --link cifrexdb"
fi

if [ "$USE_DOCKER_DB" = true ] ; then
    printf " <> WAIT 30sec FOR mariaDB\n"
    sleep 30
fi

if [ "$IMPORT_DEFAULT_DB" = true ] ; then
    sh ./importdb.sh 
fi


printf "\n=========================================================\n";
printf "> Starting cifrex container =============================\n";
printf "=========================================================\n";
docker run $ADDPARAM --name "cifrexweb" -p $IP_HTTP:$PORT_HTTP:80 -p $IP_HTTP:$PORT_HTTPS:443 -d  -it cifrex
# -v `pwd`/src/:/var/www/web/ -v `pwd`/code/:/code/ 

printf "\n\n======================================\n  cIFrex HAS BEEN STARTED\n  HTTP  : http://$IP_HTTP:$PORT_HTTP\n  HTTPS : https://$IP_HTTP:$PORT_HTTPS\n\n======================================\n\n"

if [ "$EXPORT_DB_EVERY_60SEC" = true ] ; then
    printf " <> DUMPING DB EVERY 60SEC\n"
    FILE="dump`date +'%m%d%y.%H%M.db.sql'`"
    while :
    do
    	mysqldump --defaults-file=`pwd`/config/mariadb/.my.cnf -u root cifrex_prod > ./DBDumps/latest.sql
      	cp ./DBDumps/latest.sql ./DBDumps/$FILE
    	sleep 60
    done
fi


#openssl req -new -x509 -keyout key.pem -out key.pem -days 36500 -nodes
