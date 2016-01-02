FROM centos:7

MAINTAINER "NEILDENG" <neil.deng.g@gmail.com>

RUN curl -L -O https://download.elastic.co/beats/topbeat/topbeat-1.0.0-rc2-x86_64.rpm && \
    rpm -vi topbeat-1.0.0-rc2-x86_64.rpm && \
    rm -f topbeat-1.0.0-rc2-x86_64.rpm && \
    mkdir /topbeat && \
    cd /topbeat

RUN curl -L -O http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz && \
    mkdir -p /usr/share/GeoIP && \
    gunzip -c GeoLiteCity.dat.gz > /usr/share/GeoIP/GeoLiteCity.dat

WORKDIR /topbeat

ADD files/ .

CMD ["/bin/bash"]
CMD /topbeat/start.sh
