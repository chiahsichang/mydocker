#!/bin/bash

sed -i '1cFROM '${REGISTRY_HOST}'\/'${OWNER}'\/centos-jdk-jce:'${CENTOS_VER}'-'${JDK_MAIN_VER}'u'${JDK_CPU_VER}'-'${JCE_MAIN_VER}'' Dockerfile

docker build --rm \
    --build-arg EWS_MAIN=${EWS_MAIN} \
    --build-arg EWS_SUB=${EWS_SUB} \
    -t ${REGISTRY_HOST}/${OWNER}/jboss-ews:${EWS_MAIN}.${EWS_SUB} .

