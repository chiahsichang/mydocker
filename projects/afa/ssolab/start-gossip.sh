#!/bin/bash

docker service create \
  --network afanet \
  --name gossip \
  --publish 12001:12001 \
  -e DOMAIN_MODE=gossip \
  10.82.20.11:5000/sso/jboss-eap-gossip-sso:6.4.0-1.0

