#!/bin/bash

docker service rm slave

docker service create \
  --replicas 2 \
  --network afanet \
  --name slave \
  --mount type=volume,source=iapdata_config,destination=/appdata/iapdata/config,volume-opt="type=nfs",volume-opt="o=addr=10.82.110.23,ro=0",volume-opt="device=:/appdata/iapdata/config" \
  --publish 8080:8080 \
  -e DOMAIN_MODE=slave \
  -e DOMAIN_MASTER_HOST=master \
  10.82.20.11:5000/sso/jboss-eap-gossip-sso:6.4.0-1.0

#  --mount type=volume,source=iapdata_config2,destination=/appdata/iapdata/config,volume-opt="type=nfs",volume-opt="o=addr=10.82.110.23,ro=0",volume-opt="device=:/appdata/iapdata/config" \


# --mount type=bind,source=/appdata/iapdata/config,destination=/appdata/iapdata/config \
