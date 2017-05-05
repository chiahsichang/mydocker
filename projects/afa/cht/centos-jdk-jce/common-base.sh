#!/bin/bash

sed -i '1cFROM '${REGISTRY_HOST}'\/'${OWNER}'\/centos-jdk:'${CENTOS_VER}'-'${JDK_MAIN_VER}'u'${JDK_CPU_VER}'' Dockerfile

docker build \
    --build-arg JDK_MAIN_VER=${JDK_MAIN_VER} \
    --build-arg JDK_CPU_VER=${JDK_CPU_VER} \
    --build-arg JCE_MAIN_VER=${JCE_MAIN_VER} \
    -t ${REGISTRY_HOST}/${OWNER}/centos-jdk-jce:${CENTOS_VER}-${JDK_MAIN_VER}u${JDK_CPU_VER}-${JCE_MAIN_VER} .


