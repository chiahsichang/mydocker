FROM 10.82.20.11:5000/cht/centos-jdk-jce:7-8u111-8

ARG EAP_VER
ARG EAP_PATCH_VER

ENV EAP ${EAP_VER}
ENV JBOSS_HOME /apps/jboss-eap-${EAP}
ENV PATCH_DIR /tmp/patch

ENV DOMAIN_MODE master
ENV DOMAIN_MASTER_HOST master

ENV UID 1002
ENV GID 1002

ADD ./installs/jboss-eap-*.0.zip /tmp/

ADD start.sh /usr/bin
ADD deploy.sh /usr/bin

RUN unzip /tmp/jboss-eap-${EAP}.0.zip -d /apps/ && \
    ${JBOSS_HOME}/bin/add-user.sh admin 1qaz@WSX --silent && \
    ${JBOSS_HOME}/bin/add-user.sh sso 1qaz@WSX --silent && \

    useradd -u ${UID} jboss && \
    groupmod -g ${GID} jboss && \
    chown -R jboss:jboss ${JBOSS_HOME} && \
    rm -rf /tmp/jboss-eap-*.0.zip && \

    sed -i '95,104d' ${JBOSS_HOME}/domain/configuration/host.xml && \

    sed -i 's/remote host=/remote username="sso" host=/g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
    sed -i 's/c2xhdmVfdXNlcl9wYXNzd29yZA==/MXFhekBXU1g=/g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
    sed -i '87,91d' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \

    sed -i 's/default-stack="udp">/default-stack="tcp">/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
	sed -i 's/<protocol type="MPING" socket-binding="jgroups-mping"\/>/<protocol type="TCPGOSSIP">\n@@/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's/@@/        <property name="initial_hosts">gossip[12001]<\/property>\n@@/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's/@@/        <property name="num_initial_members">1<\/property>\n@@/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's/@@/        <property name="timeout">6000<\/property>\n@@/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's/@@/    <\/protocol>/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \

    sed -i 's/profile="full"/profile="ha"/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's/ref="full-sockets"/ref="ha-sockets"/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \

	# sed -i 's|default-virtual-server="default-host" native="false"|default-virtual-server="default-host" native="false" instance-id="${jboss.node.name}"|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
		
    chmod +x /usr/bin/start.sh  && \
    
    echo "DONE!"

WORKDIR ${JBOSS_HOME}

CMD start.sh