#!/bin/bash

docker service rm master

docker service create \
  --constraint 'node.role == manager' \
  --network afanet \
  --name master \
  --publish 9990:9990 \
  --publish 9999:9999 \
  -e DOMAIN_MODE=master \
  10.82.20.11:5000/sso/jboss-eap-gossip-sso:6.4.0-1.0

