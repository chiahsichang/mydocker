#!/bin/bash

. ./swarm_up_init.sh

export | grep SWARM

SWARM_VER=1.2.2

docker -H=tcp://${SWARM0}:2375 run -d --privileged=true --restart=always \
    --name=swarm-manager \
    -h swarm-manager \
    -p 3375:2375 \
    cht/swarm:${SWARM_VER} manage consul://${SWARM0}:8500


