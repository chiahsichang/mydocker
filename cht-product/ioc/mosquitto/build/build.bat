@echo off

setlocal

set BUILD_ARG=

set PROXY=%1

if not "%PROXY%" == "" (
	set BUILD_ARG=--build-arg HTTP_PROXY=%PROXY% --build-arg http_proxy=%PROXY% --build-arg HTTPS_PROXY=%PROXY% --build-arg https_proxy=%PROXY%
)

docker build %BUILD_ARG% --rm -t cht/mosquitto:latest -t cht/mosquitto:1.0 .