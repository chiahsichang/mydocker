FROM ubuntu:16.04
MAINTAINER Jonathan Meyer <jon@gisjedi.com>

ENV GOSU_VERSION="1.10" 

ENV GOSU_ENTRYPOINT_VERSION="1.0.0"
ENV GOSU_ENTRYPOINT_DOWNLOAD="https://github.com/gisjedi/gosu-entrypoint/releases/download/$GOSU_ENTRYPOINT_VERSION/gosu-entrypoint.sh" 

RUN set -ex; \
	\
	fetchDeps=' \
		ca-certificates \
		wget \
		ntp \
		ntpdate \
	'; \
	apt-get update; \
	apt-get install -y --no-install-recommends $fetchDeps; \
	rm -rf /var/lib/apt/lists/*;
RUN set -ex; \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	\
# verify the signature
	export GNUPGHOME="$(mktemp -d)"; \
#	gpg --keyserver-options http-proxy="${HTTP_PROXY}" --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
#	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc; \
	\
	chmod +x /usr/local/bin/gosu; \
# verify that the binary works
	gosu nobody true; \
	\
	apt-get purge -y --auto-remove $fetchDeps

RUN set -ex; \
    wget -O /usr/local/bin/gosu-entrypoint.sh "$GOSU_ENTRYPOINT_DOWNLOAD"; \
    chmod +x /usr/local/bin/gosu-entrypoint.sh

# Specify any standard chown format (uid, uid:gid), default to root:root
ENV GOSU_USER 0:0

# Specify any space delimited directories that should be chowned to GOSU_USER
#ENV GOSU_CHOWN /tmp

ENTRYPOINT ["/usr/local/bin/gosu-entrypoint.sh"]