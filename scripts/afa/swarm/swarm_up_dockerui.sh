#!/bin/bash

. ./swarm_up_init.sh

export | grep SWARM

docker -H=tcp://${SWARM0}:2375 run -d --privileged --restart=always \
    --name=dockerui \
    -h dockerui  \
    -p 9000:9000 \
    -e SERVICE_9000_NAME=http \
    -e SERVICE_NAME=dockerui \
    -e SERVICE_TAGS=MA \
    uifd/ui-for-docker -e http://${SWARM0}:3375

docker -H=tcp://${SWARM1}:2375 run -d --privileged --restart=always \
    --name=dockerui \
    -h dockerui  \
    -p 9000:9000 \
    -e SERVICE_9000_NAME=http \
    -e SERVICE_NAME=dockerui \
    -e SERVICE_TAGS=MA \
    uifd/ui-for-docker -e http://${SWARM0}:3375
	
docker -H=tcp://${SWARM2}:2375 run -d --privileged --restart=always \
    --name=dockerui \
    -h dockerui  \
    -p 9000:9000 \
    -e SERVICE_9000_NAME=http \
    -e SERVICE_NAME=dockerui \
    -e SERVICE_TAGS=MA \
    uifd/ui-for-docker -e http://${SWARM0}:3375


