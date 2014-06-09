FROM ubuntu:trusty
MAINTAINER George Lewis <schvin@schvin.net>
RUN apt-get update

RUN apt-get install -y tmux python-pip
RUN pip install rackspace-novaclient

RUN addgroup --system apiclient
RUN adduser --system apiclient --group apiclient

ADD dot.bash_profile /home/apiclient/.bash_profile
RUN chown apiclient:apiclient /home/apiclient/.bash_profile
RUN chmod 600 /home/apiclient/.bash_profile

USER apiclient

CMD ["/bin/bash"]
