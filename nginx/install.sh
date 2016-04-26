
proxy=$1

test -n "$1" && proxy="-x $1" && echo "Using proxy :" $proxy

curl $proxy -L http://nginx.org/download/nginx-1.8.1.tar.gz > nginx-1.8.1.tar.gz
