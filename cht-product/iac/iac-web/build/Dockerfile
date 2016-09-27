FROM cht/tomcat-centos-jdk-jce

ENV SSO_CONFIGPATH /appdata/iac/config
ENV SSO_LOGPATH /appdata/iac/log

RUN mkdir -p "$SSO_CONFIGPATH/management"
RUN mkdir -p "$SSO_LOGPATH"

# ADD sso config files
ADD ./install/config/management/* $SSO_CONFIGPATH/management/

ENV JAVA_OPTS "$JAVA_OPTS -Dcht.security.sso.configPath=$SSO_CONFIGPATH"
ENV JAVA_OPTS "$JAVA_OPTS -Dcht.security.sso.logPath=$SSO_LOGPATH"

# ADD files
ADD ./install/iac.war /usr/local/tomcat/webapps