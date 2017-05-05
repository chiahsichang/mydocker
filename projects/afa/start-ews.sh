#!/bin/bash

docker service rm ews

docker service create \
  --constraint 'node.hostname == IAPCHVLET023' \
  --replicas 1 \
  --network afanet \
  --name ews \
  --mount type=bind,source=/appdata/iapdata/jws-3.0/conf,destination=/apps/jws-3.0/httpd/conf \
  --mount type=bind,source=/appdata/iapdata/jws-3.0/conf.d,destination=/apps/jws-3.0/httpd/conf.d \
  --mount type=bind,source=/appdata/iapdata/jws-3.0/conf.modules.d,destination=/apps/jws-3.0/httpd/conf.modules.d \
  --mount type=bind,source=/appdata/iapdata/jws-3.0/extra,destination=/apps/jws-3.0/httpd/extra \
  --mount type=bind,source=/appdata/iapdata/jws-3.0/www,destination=/apps/jws-3.0/httpd/www \
  --mount type=bind,source=/appdata/iapdata/certs/GCA3.crt,destination=/etc/pki/tls/certs/GCA3.crt \
  --mount type=bind,source=/appdata/iapdata/certs/iaptest.afa.gov.tw.crt,destination=/etc/pki/tls/certs/iaptest.afa.gov.tw.crt \
  --mount type=bind,source=/appdata/iapdata/certs/privateKey/iaptest.afa.gov.tw.key,destination=/etc/pki/tls/private/iaptest.afa.gov.tw.key \
  --publish 80:80 \
  --publish 6660:6660 \
  -e DOMAIN_MODE=slave \
  -e DOMAIN_MASTER_HOST=master \
  10.82.20.11:5000/cht/jboss-ews:3.0.2


