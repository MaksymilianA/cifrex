@echo on
cls
call win-CONFIGURE.bat

docker build -t cifrex .
docker run --name cifrexdb -p %IP_DB%:%PORT_DB%:3306 -e MYSQL_ROOT_PASSWORD=%DB_ROOT_PASS% -d mariadb:latest
TIMEOUT 30
mysql  --defaults-file=./config/mariadb/.my.cnf -u root < ./SRC/DATABASE.sql
docker run --link cifrexdb --name "cifrexweb" -p %IP_HTTP%:%PORT_HTTP%:80 -p %IP_HTTP%:%PORT_HTTPS%:443 -d -it cifrex
