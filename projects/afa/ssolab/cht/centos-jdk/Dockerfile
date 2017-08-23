FROM 192.168.32.99:5000/cht/centos-gosu:7-1.10

ARG JDK_MAIN_VER
ARG JDK_CPU_VER
ARG JDK_B_VER

RUN export | grep JDK && \
    yum update -y && \
    yum install -y wget tar.x86_64 unzip && \
    yum -y clean all && \

    mv /etc/localtime /etc/localtime.old && ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \

    wget -P /opt/ --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JDK_MAIN_VER}u${JDK_CPU_VER}-b${JDK_B_VER}/jdk-${JDK_MAIN_VER}u${JDK_CPU_VER}-linux-x64.tar.gz && \
    tar xzf /opt/jdk-${JDK_MAIN_VER}u${JDK_CPU_VER}-linux-x64.tar.gz -C /opt &&\
    rm /opt/jdk-${JDK_MAIN_VER}u${JDK_CPU_VER}-linux-x64.tar.gz  && \

    alternatives --install /usr/bin/java java /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/java 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/javac 2 && \
    alternatives --set jar /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/jar && \
    alternatives --set javac /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin/javac

ENV JAVA_HOME /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}
ENV JRE_HOME /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/jre
ENV PATH $PATH:/opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/bin:/opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/jre/bin

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

