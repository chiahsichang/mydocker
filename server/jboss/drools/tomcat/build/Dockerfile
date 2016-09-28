FROM cht/tomcat-centos-jdk-jce

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME

# ADD /lib files
ADD ./install/lib/* $CATALINA_HOME/lib/

# ADD /conf files
ADD ./install/conf/* $CATALINA_HOME/conf/

# ADD /bin files
ADD ./install/bin/* $CATALINA_HOME/bin/

# ADD files
ADD ./install/kie-drools-wb.war $CATALINA_HOME/webapps