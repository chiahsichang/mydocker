#!/bin/bash

sed -i '1cFROM '${REGISTRY_HOST}'\/'${OWNER}'\/centos-jdk:'${CENTOS_VER}'-'${JDK_MAIN_VER}'u'${JDK_CPU_VER}'' Dockerfile

if env | grep -q ^PROXY= 
then
    BUILD_ARG_PROXY="--build-arg HTTP_PROXY=${PROXY} --build-arg http_proxy=${PROXY} --build-arg HTTPS_PROXY=${PROXY} --build-arg https_proxy=${PROXY}"
    export http_proxy=${PROXY}
    export https_proxy=${PROXY}
fi

docker build \
    --build-arg JDK_MAIN_VER=${JDK_MAIN_VER} \
    --build-arg JDK_CPU_VER=${JDK_CPU_VER} \
    --build-arg JCE_MAIN_VER=${JCE_MAIN_VER} \
     ${BUILD_ARG_PROXY} \
    -t ${REGISTRY_HOST}/${OWNER}/centos-jdk-jce:${CENTOS_VER}-${JDK_MAIN_VER}u${JDK_CPU_VER}-${JCE_MAIN_VER} .


