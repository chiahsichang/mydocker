#!/bin/bash

. ./swarm_up_init.sh

export | grep SWARM

SWARM_VER=1.2.2

docker -H=tcp://${SWARM0}:2375 run -d --privileged=true --restart=always \
  --name=node0 -h node0 \
  cht/swarm:${SWARM_VER} join --advertise=${SWARM0}:2375 consul://${SWARM0}:8500


docker -H=tcp://${SWARM1}:2375 run -d --privileged=true --restart=always \
  --name=node1 -h node1 \
  cht/swarm:${SWARM_VER} join --advertise=${SWARM1}:2375 consul://${SWARM1}:8500


docker -H=tcp://${SWARM2}:2375 run -d --privileged=true --restart=always \
  --name=node2 -h node2 \
  cht/swarm:${SWARM_VER} join --advertise=${SWARM2}:2375 consul://${SWARM2}:8500

