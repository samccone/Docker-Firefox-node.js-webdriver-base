# DOCKER-VERSION 0.11.1
FROM mojo/debian:wheezy

# add wheezy backports
RUN echo "deb http://ftp.us.debian.org/debian wheezy-backports main" >> /etc/apt/sources.list

# get firefox .. aka iceweasel
RUN echo "deb http://mozilla.debian.net/ wheezy-backports iceweasel-release" >> /etc/apt/sources.list
RUN apt-get update

# get node, java, xvfb
RUN apt-get install -y curl nodejs-legacy unzip openjdk-7-jre-headless xvfb

# get firefox
RUN apt-get install -t wheezy-backports -y --force-yes iceweasel

# get fonts so xvfb does not yell at us
RUN apt-get install -y -q xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic

# install NPM
RUN curl --insecure https://www.npmjs.org/install.sh | clean=no sh

# setup our local test dir
ADD . /var/app/test

# set working dir
WORKDIR /var/app/test

# install our npm deps
RUN npm install

# enable running our main shell program
RUN chmod +x main.sh

# run it all!
ENTRYPOINT ./main.sh