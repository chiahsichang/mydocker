FROM cht/ubuntu-python:16.04-2.7
MAINTAINER Sameer Saini (sameer.saini@outlook.com)

# install dependencies
RUN apt-get update 
RUN apt-get install -y --no-install-recommends apache2; \
    apt-get install -y --no-install-recommends libapache2-mod-python; \
    apt-get install -y --no-install-recommends iputils-ping; \
	rm -r /var/lib/apt/lists/*

RUN a2enmod cgi
    
# Default command	
CMD ["apachectl", "-D", "FOREGROUND"]

# Ports
EXPOSE 80