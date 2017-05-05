#!/bin/bash

export REGISTRY_HOST=10.82.20.11:5000
export OWNER=cht
export CENTOS_VER=7
export GOSU_VERSION=1.10

chmod +x ./common-base.sh
./common-base.sh
chmod -x ./common-base.sh

