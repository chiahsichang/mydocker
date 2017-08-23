@echo off
REM docker run -d -p 11433:1433 -e sa_password=1qaz@WSX -e ACCEPT_EULA=Y microsoft/mssql-server-windows-express

docker run -d -p 11433:1433 -e sa_password=1qaz@WSX -e ACCEPT_EULA=Y --isolation=hyperv microsoft/mssql-server-windows-express