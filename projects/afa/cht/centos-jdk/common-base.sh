#!/bin/bash

sed -i '1cFROM '${REGISTRY_HOST}'\/'${OWNER}'\/centos-gosu:'${CENTOS_VER}'-'${GOSU_VER}'' Dockerfile

docker build \
    --build-arg JDK_MAIN_VER=${JDK_MAIN_VER} \
    --build-arg JDK_CPU_VER=${JDK_CPU_VER} \
    --build-arg JDK_B_VER=${JDK_B_VER} \
    -t ${REGISTRY_HOST}/${OWNER}/centos-jdk:${CENTOS_VER}-${JDK_MAIN_VER}u${JDK_CPU_VER} .

