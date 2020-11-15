@echo on
cls

for /f %%i in ('docker.exe ps -a -q -f "name=cifrexweb"') do set webid=%%i
echo %webid%
docker exec -it %webid% sh

