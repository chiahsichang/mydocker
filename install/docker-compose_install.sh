#!/bin/bash
#
#
#
#

proxy=$1
ver=$2

test -n "$1" && proxy="-x $1" && echo "Using proxy :" $proxy

curl $proxy -L https://github.com/docker/compose/releases/download/$ver/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
