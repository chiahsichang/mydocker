# install yum
yum install -y wget docker

# upgrade docker
wget https://get.docker.com/builds/Linux/x86_64/docker-latest -O /usr/bin/docker

# enalbe docker service
systemctl enable docker
systemctl start docker
docker -v

# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -v

# pull centos:7
docker pull centos:7

# pull dockerui and run it
docker run --privileged=true --restart=always --hostname=dockerui -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui


