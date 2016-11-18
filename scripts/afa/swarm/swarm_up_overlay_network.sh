#!/bin/bash

. ./swarm_up_init.sh

export | grep SWARM

docker -H=tcp://${SWARM0}:3375 network rm cht_stack
docker -H=tcp://${SWARM0}:3375 network create -d overlay --subnet=192.168.188.1/24 --gateway=192.168.188.1 cht_stack

