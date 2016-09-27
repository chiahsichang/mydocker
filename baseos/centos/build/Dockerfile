FROM docker.io/centos:7

MAINTAINER Docker <docker@cht.com.tw>

#RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8 
ENV CFLAGS -fPIC


#install required packages
RUN yum update -y && yum install -y wget tar unzip && yum -y clean all

#install Development Tools
RUN yum groupinstall -y "Development Tools"

#install openssl
RUN set -x \
    \
    && opensslBuildDir="$(mktemp -d)" \
    && cd $opensslBuildDir \
    && wget -O openssl.tar.gz https://www.openssl.org/source/openssl-1.0.2j.tar.gz \
    && tar -xvf openssl.tar.gz -C "$opensslBuildDir" \
    && cd "$opensslBuildDir/openssl-1.0.2j" \
    && ./config shared \
    && make \
    && make install \
    && rm -rf "$opensslBuildDir"

# Set localtime
RUN mv /etc/localtime /etc/localtime.old && ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime



    