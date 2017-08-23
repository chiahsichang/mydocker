#!/bin/bash
#set -x
#sed -i '1cFROM '${REGISTRY_HOST}'\/'${OWNER}'\/ubuntu-apache2:'${UBUNTU_OS_VER}'-'${APACHE2_VER}'' Dockerfile

if env | grep -q ^PROXY= 
then
    BUILD_ARG_PROXY="--build-arg HTTP_PROXY=${PROXY} --build-arg http_proxy=${PROXY} --build-arg HTTPS_PROXY=${PROXY} --build-arg https_proxy=${PROXY}"
    export http_proxy=${PROXY}
    export https_proxy=${PROXY}
fi

docker build \
    ${BUILD_ARG_PROXY} \
    -t ${REGISTRY_HOST}/${OWNER}/ubuntu-apache2:${UBUNTU_OS_VER}-${APACHE2_VER} .

