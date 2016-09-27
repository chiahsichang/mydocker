FROM centos:7

MAINTAINER Neil Deng <neil.deng.g@gmail.com>


#install required packages
RUN yum update -y && yum install -y \
    wget \
    tar.x86_64 \
    && yum -y clean all


#install oracle jdk8
RUN wget -P /opt/ --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz \
    && tar xzf /opt/jdk-8u65-linux-x64.tar.gz -C /opt \
    && rm /opt/jdk-8u65-linux-x64.tar.gz
RUN alternatives --install /usr/bin/java java /opt/jdk1.8.0_65/bin/java 2 \
    && alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_65/bin/jar 2 \
    && alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_65/bin/javac 2 \
    && alternatives --set jar /opt/jdk1.8.0_65/bin/jar \
    && alternatives --set javac /opt/jdk1.8.0_65/bin/javac


ENV JAVA_HOME /opt/jdk1.8.0_65 
ENV JRE_HOME /opt/jdk1.8.0_65/jre 
ENV PATH $PATH:/opt/jdk1.8.0_65/bin:/opt/jdk1.8.0_65/jre/bin
