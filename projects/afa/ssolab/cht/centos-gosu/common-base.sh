#!/bin/bash
#set -x

docker tag ${OWNER}/centos:${CENTOS_VER} ${REGISTRY_HOST}/${OWNER}/centos:${CENTOS_VER}

sed -i '1cFROM '${REGISTRY_HOST}'\/'${OWNER}'\/centos:'${CENTOS_VER}'' Dockerfile


if env | grep -q ^PROXY= 
then
    BUILD_ARG_PROXY="--build-arg HTTP_PROXY=${PROXY} --build-arg http_proxy=${PROXY} --build-arg HTTPS_PROXY=${PROXY} --build-arg https_proxy=${PROXY}"
    export http_proxy=${PROXY}
    export https_proxy=${PROXY}
fi

docker build \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    ${BUILD_ARG_PROXY} \
    -t ${REGISTRY_HOST}/${OWNER}/centos-gosu:${CENTOS_VER}-${GOSU_VERSION} .

