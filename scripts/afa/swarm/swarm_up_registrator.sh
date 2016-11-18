#!/bin/bash

. ./swarm_up_init.sh

export | grep SWARM

docker -H=tcp://${SWARM0}:2375 run -d --privileged=true --restart=always \
  --name=master-reg -h master-reg \
  --volume=/var/run/docker.sock:/tmp/docker.sock \
  gliderlabs/registrator:v7 consul://${SWARM0}:8500


docker -H=tcp://${SWARM1}:2375 run -d --privileged=true --restart=always \
  --name=master-reg -h master-reg \
  --volume=/var/run/docker.sock:/tmp/docker.sock \
  gliderlabs/registrator:v7 consul://${SWARM1}:8500


docker -H=tcp://${SWARM2}:2375 run -d --privileged=true --restart=always \
  --name=master-reg -h master-reg \
  --volume=/var/run/docker.sock:/tmp/docker.sock \
  gliderlabs/registrator:v7 consul://${SWARM2}:8500

