FROM ubuntu:trusty
MAINTAINER George Lewis <schvin@schvin.net>
RUN apt-get update

RUN apt-get install -y tmux python-pip
RUN pip install rackspace-novaclient

RUN adduser apiclient --disabled-password

ADD dot.bash_profile /home/apiclient/.bash_profile
RUN chown apiclient:apiclient /home/apiclient/.bash_profile
RUN chmod 600 /home/apiclient/.bash_profile

USER apiclient
WORKDIR /home/apiclient

CMD ["/bin/bash"]
