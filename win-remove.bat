@echo on
cls

for /f %%i in ('docker.exe ps -a -q -f "name=cifrexdb"') do set dbid=%%i
echo %dbid%
docker stop %dbid%
docker rm %dbid%

for /f %%i in ('docker.exe ps -a -q -f "name=cifrexweb"') do set webid=%%i
echo %webid%
docker stop %webid%
docker rm %webid%

pause