FROM cht/ubuntu-gosu:latest
MAINTAINER chrischang <chiahsi.chang@gmail.com>

RUN set -ex; \
	apt-get update; 

#RUN set -ex; \
#	apt-get install -y --no-install-recommends python-software-properties; \
#	apt-get install -y --no-install-recommends software-properties-common; \
#    apt-get install -y --no-install-recommends ppa-purge; \
#	add-apt-repository ppa:fkrull/deadsnakes-python2.7;

RUN set -ex; \	
	apt-get install -y --no-install-recommends python2.7; 

RUN set -ex; \
	apt-get install -y --no-install-recommends python-pip; \
	apt-get install -y --no-install-recommends build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libssl-dev; \
	apt-get install -y --no-install-recommends libmysqlclient-dev; \
    pip install --upgrade pip;
    
RUN set -ex; \
    pip install setuptools; \
    pip install configobj; \
    pip install html5lib; \    
    pip install json-rpc; \
    pip install mysql-connector==2.1.4; \ 
    pip install MySQL-python; \
    pip install PAM; \    
    pip install pyOpenSSL; \
    pip install pyserial; \
    pip install python-debian; \
    pip install zope.interface; \
    pip install web3; \
    pip install ssh-import-id; \       
    pip install wheel;
