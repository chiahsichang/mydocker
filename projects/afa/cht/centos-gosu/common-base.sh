#!/bin/bash

sed -i '1cFROM '${REGISTRY_HOST}'\/'${OWNER}'\/centos:'${CENTOS_VER}'' Dockerfile

docker build \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    -t ${REGISTRY_HOST}/${OWNER}/centos-gosu:${CENTOS_VER}-${GOSU_VERSION} .

