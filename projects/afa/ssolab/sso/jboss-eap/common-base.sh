#!/bin/bash
set -x
sed -i '1cFROM '${REGISTRY_HOST}'\/'${FROM_IMAGE}':'${EAP_VER}'' Dockerfile

docker build --rm \
    --build-arg EAP_VER=${EAP_VER} \
    --build-arg SSO_VER=${SSO_VER} \
	--build-arg CAS_CLIENT_HOST=${CAS_CLIENT_HOST} \
    --build-arg CAS_HOST=${CAS_HOST} \
    --build-arg CAS_VALIDATE_TICKET_HOST=${CAS_VALIDATE_TICKET_HOST} \
    --build-arg SSO_CONFIG=${SSO_CONFIG} \
    --build-arg SSO_LOG=${SSO_LOG} \
    --build-arg LEGAL_DOMAIN=${LEGAL_DOMAIN} \
    -t ${REGISTRY_HOST}/${OWNER}/jboss-eap-gossip-sso:${EAP_VER}-${SSO_VER} .
