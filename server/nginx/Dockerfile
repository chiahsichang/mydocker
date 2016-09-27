FROM centos:7

RUN \
  yum clean all && \
  yum -y install gcc gcc-c++ make zlib-devel pcre-devel openssl-devel wget git

ENV NGINX_VER 1.9.14

RUN \
  mkdir ~/sources && \
  cd ~/sources && \
  wget http://nginx.org/download/nginx-${NGINX_VER}.tar.gz && \
  tar -zxvf nginx-${NGINX_VER}.tar.gz && \
  git clone https://bitbucket.org/nginx-goodies/nginx-sticky-module-ng.git && \
  cd nginx-${NGINX_VER} && \
  ./configure \
    --prefix=/etc/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --sbin-path=/usr/sbin/nginx \
    --pid-path=/var/log/nginx/nginx.pid \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --with-http_stub_status_module \
    --add-module=/root/sources/nginx-sticky-module-ng && \
  make && \
  make install && \
  rm -rf ~/sources

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD /usr/sbin/nginx -g 'daemon off;'

# Expose ports.
EXPOSE 80 443
