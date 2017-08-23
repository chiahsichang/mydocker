#!/bin/bash
set -x
cd $(dirname $0)

export REGISTRY_HOST=192.168.32.99:5000
export OWNER=sso
export FROM_IMAGE=cht\/jboss-eap-gossip
export EAP_VER=6.4.0
export SSO_VER=1.0

export CAS_CLIENT_HOST="http://10.82.110.23"
export CAS_HOST="http://10.82.110.23"
export CAS_VALIDATE_TICKET_HOST="http://localhost:8080"
export SSO_CONFIG="/appdata/iapdata/config/sso"
export SSO_LOG="/appdata/iapdata/logs/sso"
export LEGAL_DOMAIN="172.18.0.1,10.82.110.23,10.82.110.24"

chmod +x ./common-base.sh
./common-base.sh
chmod -x ./common-base.sh
