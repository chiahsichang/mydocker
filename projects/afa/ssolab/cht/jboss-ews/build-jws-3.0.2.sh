#!/bin/bash

export REGISTRY_HOST=192.168.32.99:5000
export OWNER=cht
export CENTOS_VER=7
export JDK_MAIN_VER=8
export JDK_CPU_VER=111
export JCE_MAIN_VER=8

export EWS_MAIN=3.0
export EWS_SUB=2

if [ $# -eq 1 ]
then
    export PROXY=$1
fi

chmod +x ./common-base.sh
./common-base.sh
chmod -x ./common-base.sh

