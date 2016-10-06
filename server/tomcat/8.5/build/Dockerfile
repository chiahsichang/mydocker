FROM cht/centos-jdk-jce

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# let "Tomcat Native" live somewhere isolated
ENV TOMCAT_NATIVE_LIBDIR $CATALINA_HOME/native-jni-lib
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$TOMCAT_NATIVE_LIBDIR

# runtime dependencies for Tomcat Native Libraries
# Tomcat Native 1.2+ requires a newer version of OpenSSL than debian:jessie has available (1.0.2g+)
# see http://tomcat.10.x6.nabble.com/VOTE-Release-Apache-Tomcat-8-0-32-tp5046007p5046024.html (and following discussion)
ENV OPENSSL_VERSION 1.0.2i-1
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.5

# https://issues.apache.org/jira/browse/INFRA-8753?focusedCommentId=14735394#comment-14735394
ENV TOMCAT_TGZ_URL https://www.apache.org/dyn/closer.cgi?action=download&filename=tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
# not all the mirrors actually carry the .asc files :'(
ENV TOMCAT_ASC_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz.asc

RUN set -x \
    \
    && wget -O tomcat.tar.gz "$TOMCAT_TGZ_URL" \
    && wget -O KEYS https://www.apache.org/dist/tomcat/tomcat-8/KEYS \
    && gpg --import ./KEYS \
    && wget -O tomcat.tar.gz.asc "$TOMCAT_ASC_URL" \
    && gpg --batch --verify tomcat.tar.gz.asc tomcat.tar.gz \
    && tar -xvf tomcat.tar.gz --strip-components=1 \
    && rm bin/*.bat \
    && rm tomcat.tar.gz*

RUN set -x \
    \
    && aprBuildDir="$(mktemp -d)" \
    && cd "$aprBuildDir" \
    && wget -O apr.tar.gz http://ftp.mirror.tw/pub/apache/apr/apr-1.5.2.tar.gz \
    && tar -xvf apr.tar.gz -C "$aprBuildDir" \
    && cd "$aprBuildDir/apr-1.5.2" \
    && ./configure \
    && make \
    && make install \
    && rm -rf "$aprBuildDir"

RUN set -x \
    \
    && aprutilBuildDir="$(mktemp -d)" \
    && cd "$aprutilBuildDir" \
    && wget -O apr-util.tar.gz http://ftp.mirror.tw/pub/apache/apr/apr-util-1.5.4.tar.gz \
    && tar -xvf apr-util.tar.gz -C "$aprutilBuildDir" \
    && cd "$aprutilBuildDir/apr-util-1.5.4" \
    && ./configure --with-apr=/usr/local/apr \
    && make \
    && make install \
    && rm -rf "$aprutilBuildDir"
    
RUN set -x \
    \
    && cd $CATALINA_HOME \ 
    && nativeBuildDir="$(mktemp -d)" \
    && tar -xvf bin/tomcat-native.tar.gz -C "$nativeBuildDir" --strip-components=1 \
    && ( \
        export CATALINA_HOME="$PWD" \
        && cd "$nativeBuildDir/native" \
        && ./configure \
            --libdir="$TOMCAT_NATIVE_LIBDIR" \
            --prefix="$CATALINA_HOME" \
            --with-apr="/usr/local/apr" \
            --with-java-home="/opt/jdk1.8.0_101" \
            #--with-ssl=yes \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -rf "$nativeBuildDir" \
    && rm bin/tomcat-native.tar.gz

# verify Tomcat Native is working properly
RUN set -e \
    && nativeLines="$(catalina.sh configtest 2>&1)" \
    && nativeLines="$(echo "$nativeLines" | grep 'Apache Tomcat Native')" \
    && nativeLines="$(echo "$nativeLines" | sort -u)" \
    && if ! echo "$nativeLines" | grep 'INFO: Loaded APR based Apache Tomcat Native library' >&2; then \
        echo >&2 "$nativeLines"; \
        exit 1; \
    fi

EXPOSE 8080
CMD ["catalina.sh", "run"]