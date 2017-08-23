#!/bin/bash

export REGISTRY_HOST=192.168.30.121:5000
export OWNER=cht
export UBUNTU_OS_VER=16.04
export APACHE2_VER=2.4
export GOSU_VER=1.10

if [ $# -eq 1 ]
then
    export PROXY=$1
fi

chmod +x ./common-base.sh
./common-base.sh
chmod -x ./common-base.sh

