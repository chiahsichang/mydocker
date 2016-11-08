FROM node:6.7.0
 
RUN curl -o- -L https://yarnpkg.com/install.sh | bash && \
  echo "" >> ~/.bashrc && \
  echo 'export PATH="$HOME/.yarn/bin:$PATH"' >> ~/.bashrc
  
RUN npm config set https-proxy $HTTPS_PROXY && \
    npm config set proxy $HTTP_PROXY && \
    npm config set strict-ssl false
  
ADD ./package.json /home
  
 
CMD /bin/bash