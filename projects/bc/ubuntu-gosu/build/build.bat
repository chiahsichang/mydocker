@echo off

setlocal

set BUILD_ARG=

set PROXY=%1

if not "%PROXY%" == "" (
	set BUILD_ARG=--build-arg HTTP_PROXY=%PROXY% --build-arg http_proxy=%PROXY% --build-arg HTTPS_PROXY=%PROXY% --build-arg https_proxy=%PROXY%
)

docker build %BUILD_ARG% --rm=true --force-rm=true -t cht/ubuntu-gosu:latest -t cht/ubuntu-gosu:16.04 .
