FROM 10.82.20.11:5000/cht/centos-jdk-jce:7-8u111-8

ADD installs/*.zip /tmp/   

ARG EWS_MAIN
ARG EWS_SUB

ENV EWS_HOME=/apps/jws-${EWS_MAIN}/httpd

ENV UID=1001 
ENV GID=1001

RUN yum update -y &&   \
    yum install -y apr apr-devel apr-util apr-util-devel apr-util-ldap elinks krb5-workstation mailcap yajl openssl && \
    yum clean -y all

RUN unzip /tmp/jws-httpd-${EWS_MAIN}.${EWS_SUB}-RHEL7-x86_64.zip -d /apps/ && \
    rm -f /tmp/jws-httpd-${EWS_MAIN}.${EWS_SUB}-RHEL7-x86_64.zip && \
    groupadd -g ${GID} -r apache && \
    useradd -c 'apache' -u ${UID} -g apache -s /bin/sh -r apache && \
    cd /apps/jws-${EWS_MAIN} && \
    chown -R apache:apache httpd && \
    cd /apps/jws-${EWS_MAIN}/httpd && \
    ./.postinstall && \
    mv /apps/jws-${EWS_MAIN}/httpd/conf.d/ssl.conf /apps/jws-${EWS_MAIN}/httpd/conf.d/ssl.conf.disabled && \
    sed -i 's/Listen 127.0.0.1:80/Listen 80/g' ${EWS_HOME}/conf/httpd.conf

WORKDIR ${EWS_HOME}

EXPOSE 80

CMD ${EWS_HOME}/sbin/httpd -DFOREGROUND -f ${EWS_HOME}/conf/httpd.conf




