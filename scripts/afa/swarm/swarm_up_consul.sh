#!/bin/bash

. ./swarm_up_init.sh

export | grep SWARM

# master consul
docker -H=tcp://${SWARM0}:2375 run -d --privileged --restart=always \
  --name=consul0 -h consul0 \
  -p 8300:8300 \
  -p 8301:8301 \
  -p 8301:8301/udp \
  -p 8302:8302 \
  -p 8302:8302/udp \
  -p 8400:8400 \
  -p 8500:8500 \
  -p 53:53/udp \
  -e SERVICE_8500_NAME=http \
  -e SERVICE_NAME=consul \
  -e SERVICE_TAGS=SWARM \
  progrium/consul -server -advertise ${SWARM0} -bootstrap

# 
docker -H=tcp://${SWARM1}:2375 run -d --privileged --restart=always \
  --name=consul1 -h consul1 \
  -p 8300:8300 \
  -p 8301:8301 \
  -p 8301:8301/udp \
  -p 8302:8302 \
  -p 8302:8302/udp \
  -p 8400:8400 \
  -p 8500:8500 \
  -p 53:53/udp \
  -e SERVICE_8500_NAME=http \
  -e SERVICE_NAME=consul \
  -e SERVICE_TAGS=SWARM \
  progrium/consul -server -advertise ${SWARM1} -join ${SWARM0}


#
docker -H=tcp://${SWARM2}:2375 run -d --privileged --restart=always \
  --name=consul2 -h consul2 \
  -p 8300:8300 \
  -p 8301:8301 \
  -p 8301:8301/udp \
  -p 8302:8302 \
  -p 8302:8302/udp \
  -p 8400:8400 \
  -p 8500:8500 \
  -p 53:53/udp \
  -e SERVICE_8500_NAME=http \
  -e SERVICE_NAME=consul \
  -e SERVICE_TAGS=SWARM \
  progrium/consul -server -advertise ${SWARM2} -join ${SWARM0}


