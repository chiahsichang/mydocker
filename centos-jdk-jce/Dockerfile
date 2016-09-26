FROM docker.io/centos:7

MAINTAINER Docker <docker@cht.com.tw>

#RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8 

ENV FIRST_VER 1
ENV MAIN_VER 8
ENV CPU_VER 101

#install required packages
RUN yum update -y && yum install -y wget tar unzip && yum -y clean all

#download oracle jdk
RUN wget -P /opt/ --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${MAIN_VER}u${CPU_VER}-b13/jdk-${MAIN_VER}u${CPU_VER}-linux-x64.tar.gz \
    && tar xzf /opt/jdk-${MAIN_VER}u${CPU_VER}-linux-x64.tar.gz -C /opt \
    && rm /opt/jdk-${MAIN_VER}u${CPU_VER}-linux-x64.tar.gz

#download oracle jce
RUN wget -P /opt/ --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/${MAIN_VER}/jce_policy-${MAIN_VER}.zip \
    && unzip /opt/jce_policy-${MAIN_VER}.zip -d /opt/ \
    && rm /opt/jce_policy-${MAIN_VER}.zip \
	&& mv /opt/UnlimitedJCEPolicyJDK${MAIN_VER}/*.jar /opt/jdk${FIRST_VER}.${MAIN_VER}.0_${CPU_VER}/jre/lib/security/

# Set localtime
RUN mv /etc/localtime /etc/localtime.old && ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime


# alternatives java jar and javac
RUN alternatives --install /usr/bin/java java /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/java 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/javac 2 && \
    alternatives --set jar /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/jar && \
    alternatives --set javac /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/javac
    