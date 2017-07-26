FROM cht/ubuntu-gosu:latest
MAINTAINER chrischang <chiahsi.chang@gmail.com>

RUN set -ex; \
	apt-get update; 

RUN set -ex; \
	apt-get install -y --no-install-recommends python-software-properties; \
	apt-get install -y --no-install-recommends software-properties-common; \
	add-apt-repository ppa:fkrull/deadsnakes-python2.7;  

RUN set -ex; \	
	apt-get install python2.7; 

RUN set -ex; \
	apt-get install -y --no-install-recommends python-pip; \
	apt-get install -y --no-install-recommends python-dev; \
	apt-get install -y --no-install-recommends libmysqlclient-dev;