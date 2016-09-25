FROM cht/centos-jdk-jce:7-8u66-8

MAINTAINER DOCKER <docker@cht.com.tw>

ENV EAP 6.4

ENV UID 1002
ENV GID 1002

# copy jboss eap file
ADD ./installs/jboss-eap-${EAP}.0.zip /tmp/
ADD ./installs/jboss-eap-${EAP}.6-patch.zip /tmp/
RUN unzip /tmp/jboss-eap-${EAP}.0.zip -d /apps/ \
    && rm -rf /tmp/jboss-eap-${EAP}.0.zip \
    && useradd -u ${UID} jboss \
    && groupmod -g ${GID} jboss \
    && chown -R jboss:jboss /apps/jboss-eap-${EAP}
    
ENV EAP_HOME /apps/jboss-eap-${EAP}

RUN ${EAP_HOME}/bin/add-user.sh admin 1qaz@WSX --silent

EXPOSE 9990 9999 8080 8787 8443

CMD ["/bin/bash"]
