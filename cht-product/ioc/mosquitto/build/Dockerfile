FROM cht/centos

# ADD files
ADD ./install/home-oojah-mqtt.repo /etc/yum.repos.d/

#RUN echo "ip_resolve=4" >> /etc/yum.conf \
#    && echo "proxy=http://proxy.cht.com.tw:8080" >> /etc/yum.conf

#update packages
RUN set -x && yum update -y && yum -y clean all
   
#install required packages   
RUN yum install -y mosquitto mosquitto-clients && yum -y clean all

ADD ./install/conf.d/mqtt_port.conf /etc/mosquitto/conf.d/

EXPOSE 1883 9001
CMD /usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf