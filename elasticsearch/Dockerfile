FROM shona/centos-jdk:7-8u65

MAINTAINER "NEILDENG" <"Neil.Deng.g@gmail.com">


ENV ES_VER 2.0.0

RUN wget --no-check-certificate https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VER}/elasticsearch-${ES_VER}.tar.gz

RUN tar -xf elasticsearch-${ES_VER}.tar.gz
RUN rm elasticsearch-${ES_VER}.tar.gz


RUN adduser elasticsearch
RUN chown -R elasticsearch:elasticsearch elasticsearch-${ES_VER}
RUN su

RUN elasticsearch-${ES_VER}/bin/plugin install mobz/elasticsearch-head
RUN elasticsearch-${ES_VER}/bin/plugin install royrusso/elasticsearch-HQ
#RUN elasticsearch-${ES_VER}/bin/plugin install karmi/elasticsearch-paramedic
#RUN elasticsearch-${ES_VER}/bin/plugin install polyfractal/elasticsearch-segmentspy
#RUN elasticsearch-${ES_VER}/bin/plugin install xyu/elasticsearch-whatson

EXPOSE 9300
EXPOSE 9200

ENV CLUSTER_NAME ES

USER elasticsearch 

#CMD ["/bin/bash"]
CMD elasticsearch-${ES_VER}/bin/elasticsearch -Des.network.host=0.0.0.0 -Des.cluster.name=${CLUSTER_NAME} -Des.node.name=\${HOSTNAME}
