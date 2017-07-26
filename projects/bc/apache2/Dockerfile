FROM cht/ubuntu-gosu:16.04
MAINTAINER Sameer Saini (sameer.saini@outlook.com)

# install dependencies
RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
		apache2 \
	&& rm -r /var/lib/apt/lists/*

RUN a2enmod cgi
    
# Default command	
CMD ["apachectl", "-D", "FOREGROUND"]

# Ports
EXPOSE 80