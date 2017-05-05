#!/bin/bash

export REGISTRY_HOST=10.82.20.11:5000
export OWNER=cht
export CENTOS_VER=7
export JDK_MAIN_VER=8
export JDK_CPU_VER=111
export JDK_B_VER=14
export GOSU_VER=1.10

chmod +x ./common-base.sh
./common-base.sh
chmod -x ./common-base.sh

