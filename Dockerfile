FROM ubuntu:12.04
MAINTAINER Karunakar Reddy<karunakarreddy.chityala@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y build-essential git python-setuptools python-virtualenv

# Create the portainer user
RUN useradd portainer

# Install the portainer source code
ADD ./ /opt/portainer

# Setup the python virtualenv
RUN chown -R portainer: /opt/portainer
USER portainer
RUN cd /opt/portainer && bin/setup
