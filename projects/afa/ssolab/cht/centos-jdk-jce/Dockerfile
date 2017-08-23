FROM 192.168.32.99:5000/cht/centos-jdk:7-8u111

ARG JDK_MAIN_VER
ARG JDK_CPU_VER
ARG JCE_MAIN_VER

RUN wget -P /opt/ --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/${JCE_MAIN_VER}/jce_policy-${JCE_MAIN_VER}.zip && \
    unzip /opt/jce_policy-${JCE_MAIN_VER}.zip -d /opt/ && \
    rm /opt/jce_policy-${JCE_MAIN_VER}.zip  && \
    mv /opt/UnlimitedJCEPolicyJDK${JCE_MAIN_VER}/*.jar /opt/jdk1.${JDK_MAIN_VER}.0_${JDK_CPU_VER}/jre/lib/security/





