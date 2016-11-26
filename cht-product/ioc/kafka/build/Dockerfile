FROM cht/centos-jdk-jce

ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.10.0.1
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

#Fixing CentOS 7 systemd conflicts with docker
RUN yum clean all && yum swap -y fakesystemd systemd

#install required packages
RUN yum update -y && yum install -y python-setuptools && yum -y clean all

RUN easy_install supervisor

RUN mkdir -p /etc/supervisor.d && echo_supervisord_conf > /etc/supervisor.d/supervisord.conf

ADD ./install/supervisor/supervisord.service /usr/lib/systemd/system/

RUN chmod 644 /usr/lib/systemd/system/supervisord.service && systemctl enable supervisord && systemctl start supervisord

ADD scripts/start-kafka.sh /usr/bin/start-kafka.sh

# Supervisor config
ADD supervisor/kafka.conf supervisor/zookeeper.conf /etc/supervisor/conf.d/

RUN mkdir -p "$KAFKA_HOME"
WORKDIR $KAFKA_HOME

RUN set -x \
    \
    && wget -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz  http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz \
#    && wget -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz.asc https://dist.apache.org/repos/dist/release/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz.asc \
#    && gpg --batch --verify /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz.asc /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz \    
    && tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /$KAFKA_HOME \
    && rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"*
    
