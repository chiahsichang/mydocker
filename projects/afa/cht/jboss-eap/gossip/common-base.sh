#!/bin/bash

sed -i '1cFROM '${REGISTRY_HOST}'\/'${OWNER}'\/centos-jdk-jce:'${CENTOS_VER}'-'${JDK_MAIN_VER}'u'${JDK_CPU_VER}'-'${JCE_MAIN_VER}'' Dockerfile

docker build --rm \
    --build-arg EAP_VER=${EAP_VER} \
    --build-arg EAP_PATCH_VER=${EAP_PATCH_VER} \
    -t ${REGISTRY_HOST}/${OWNER}/jboss-eap-gossip:${EAP_VER}.${EAP_PATCH_VER} .

