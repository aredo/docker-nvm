FROM ubuntu:trusty
MAINTAINER Hengki Sihombing <hengki.sihombing@gmail.com>

# Setup NodeSource Official PPA
RUN apt-get update && \
    apt-get install -y --force-yes \
      curl \
      wget \
      git-core \
      g++ \
      libssl-dev \
      libxml2-dev \
      apt-transport-https \
      lsb-release \
      build-essential \
      python-all

RUN apt-get update
RUN git clone https://github.com/creationix/nvm.git /.nvm
RUN echo ". /.nvm/nvm.sh" >> /etc/bash.bashrc
RUN /bin/bash -c '. /.nvm/nvm.sh && nvm install v0.10.33 && nvm use v0.10.33 && nvm alias default v0.10.33 && ln -s /.nvm/v0.10.33/bin/node /usr/bin/node && ln -s /.nvm/v0.10.33/bin/npm /usr/bin/npm'

RUN npm install -g node-gyp \
 && npm cache clear