#!/bin/bash

docker build \
    --build-arg HTTP_PROXY=http://proxy.cht.com.tw:8080 \
    --build-arg http_proxy=http://proxy.cht.com.tw:8080 \
    --build-arg HTTPS_PROXY=http://proxy.cht.com.tw:8080 \
    --build-arg https_proxy=http://proxy.cht.com.tw:8080 \
    -t cht/centos-nginx . 
