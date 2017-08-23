#!/bin/bash
workdir=$(dirname $0)
cd $workdir

export REGISTRY_HOST=192.168.32.99:5000
export OWNER=cht
export CENTOS_VER=7
export JDK_MAIN_VER=8
export JDK_CPU_VER=111
export JCE_MAIN_VER=8
export EAP_VER=6.4
export EAP_PATCH_VER=0

chmod +x ./common-base.sh
./common-base.sh
chmod -x ./common-base.sh

