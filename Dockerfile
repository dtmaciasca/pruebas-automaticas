FROM jenkins/jenkins:lts
 
USER root

RUN apt-get update -qq
RUN apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 
RUN apt-key fingerprint 0EBFCD88 
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" 
RUN apt-get update -qq 
RUN apt-get install -qqy docker-ce
RUN usermod -aG docker jenkins && \
RUN chgrp docker /var/run/docker.sock

