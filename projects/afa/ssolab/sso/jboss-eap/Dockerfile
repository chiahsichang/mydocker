FROM 192.168.32.99:5000/cht/jboss-eap-gossip:6.4.0

ARG EAP_VER
ARG SSO_VER

ARG CAS_CLIENT_HOST
ARG CAS_HOST
ARG CAS_VALIDATE_TICKET_HOST
ARG SSO_CONFIG
ARG SSO_LOG
ARG LEGAL_DOMAIN

# ADD ./config /appdata/iapdata/config
ADD start.sh /usr/bin

ADD ./certs/GCA3.crt /etc/pki/tls/certs/GCA3.crt
ADD ./certs/iaptest.afa.gov.tw.crt /etc/pki/tls/certs/iaptest.afa.gov.tw.crt
ADD ./certs/iaptest.afa.gov.tw.key /etc/pki/tls/private/iaptest.afa.gov.tw.key
ADD ./welcome-content ${JBOSS_HOME}/welcome-content

ENV com_cht_iam_configpath /appdata/iapdata/config/iam
ENV com_cht_iam_logpath /appdata/iapdata/logs/iam

ENV cht_security_sso_casClientHost=${CAS_CLIENT_HOST} \
    cht_security_sso_casHost=${CAS_HOST} \
    cht_security_sso_casValidateTicketHost=${CAS_VALIDATE_TICKET_HOST} \
    cht_security_sso_configPath=${SSO_CONFIG} \
    cht_security_sso_logPath=${SSO_LOG} \
    cht_security_sso_legalDomain=${LEGAL_DOMAIN}
	    
RUN export | grep cht_security_sso_ && \
    mkdir -p /appdata/iapdata/logs/iam && \ 
	
	
	
	sed -i 's|connector="ajp"|connector="http" balancer="myBalancer" proxy-list="ews:6660" excluded-contexts="invoker,juddi,jmx-console,web-console,bossws" |g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    
	sed -i 's/enable-welcome-root="true"/enable-welcome-root="false"/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's/<server-group name="main-server-group" profile="ha">/<server-group name="main-server-group" profile="ha">\n@@/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's/@@/            <system-properties>\n@@/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.casClientHost" value="'${cht_security_sso_casClientHost}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.casHost" value="'${cht_security_sso_casHost}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's|@@|                <property name="cht.security.sso.casValidateTicketHost" value="'${cht_security_sso_casValidateTicketHost}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's|@@|                <property name="cht.security.sso.configPath" value="'${cht_security_sso_configPath}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.logPath" value="'${cht_security_sso_logPath}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's|@@|                <property name="cht.security.sso.legalDomain" value="'${cht_security_sso_legalDomain}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
    sed -i 's/@@/            <\/system-properties>/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \

#    sed -i 's|</server-group>|<\/server-group>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|        <server-group name="other-server-group" profile="ha">\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's/@@/            <system-properties>\n@@/g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.casClientHost" value="'${cht_security_sso_casClientHost}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.casHost" value="'${cht_security_sso_casHost}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.casValidateTicketHost" value="'${cht_security_sso_casValidateTicketHost}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.configPath" value="'${cht_security_sso_configPath}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.logPath" value="'${cht_security_sso_logPath}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <property name="cht.security.sso.legalDomain" value="'${cht_security_sso_legalDomain}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|            <\/system-properties>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|            <jvm name="default">\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <heap size="1000m" max-size="1000m"\/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|                <permgen max-size="256m"\/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|            <\/jvm>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|            <socket-binding-group ref="ha-sockets"\/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|        <\/server-group>|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \

#    sed -i 's|<\/server>|<\/server>\n@@|g' ${JBOSS_HOME}/domain/configuration/host.xml && \
#    sed -i 's|@@|        <server name="server-two" group="other-server-group" auto-start="false">\n@@|g' ${JBOSS_HOME}/domain/configuration/host.xml && \
#    sed -i 's|@@|            <socket-bindings socket-binding-group="ha-sockets" port-offset="5"\/>\n@@|g' ${JBOSS_HOME}/domain/configuration/host.xml && \
#    sed -i 's|@@|        <\/server>|g' ${JBOSS_HOME}/domain/configuration/host.xml && \

#    sed -i 's|<server name="server-one" group="main-server-group"\/>|<server name="server-one" group="main-server-group"\/>\n@@|g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
#    sed -i 's|@@|        <server name="server-two" group="other-server-group" auto-start="false">\n@@|g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
#    sed -i 's|@@|            <socket-bindings socket-binding-group="ha-sockets" port-offset="5"\/>\n@@|g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
#    sed -i 's|@@|        <\/server>|g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \

#    sed -i 's|<alias name="example.com"\/>|<alias name="example.com"\/>\n<alias name="bi.afa.gov.tw"\/>|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
	
#	sed -i 's|<\/virtual-server>|<\/virtual-server>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|        <virtual-server name="esigate" enable-welcome-root="false">\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|            <alias name="slave"\/>\n@@|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \
#    sed -i 's|@@|        <\/virtual-server>|g' ${JBOSS_HOME}/domain/configuration/domain.xml && \

    sed -i 's|<host xmlns="urn:jboss:domain:1.7">|<host xmlns="urn:jboss:domain:1.7">\n@@|g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
    sed -i 's|@@|            <system-properties>\n@@|g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
    sed -i 's|@@|                <property name="cht.security.sso.logPath" value="'${cht_security_sso_logPath}/\${jboss.host.name}'" boot-time="false" \/>\n@@|g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
    sed -i 's|@@|            <\/system-properties>|g' ${JBOSS_HOME}/domain/configuration/host-slave.xml && \
    
	chmod +x /usr/bin/start.sh  && \
    chown -R jboss:jboss /appdata/iapdata/ && \
    chown -R jboss:jboss ${JBOSS_HOME}/welcome-content 
	
