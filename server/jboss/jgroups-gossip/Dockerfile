FROM cht/centos-jdk-jce:latest

ENV JGROUPS_VERSION 3.2.13.Final 

ENV JGROUPS_SHA1 d471b355c5d8a1d2ad87d6dd4e64fce8391a59d2

RUN curl -o jgroups.jar https://repo1.maven.org/maven2/org/jgroups/jgroups/$JGROUPS_VERSION/jgroups-$JGROUPS_VERSION.jar \ 
    && sha1sum jgroups.jar | grep $JGROUPS_SHA1

EXPOSE 12001

CMD ["java","-classpath","jgroups.jar","org.jgroups.stack.GossipRouter"]