
FROM ubuntu:trusty
MAINTAINER Adrián Norte <anortef@gmail.com>

RUN apt-get install wget -y
RUN echo '127.0.0.1 localhost.localdomain localhost' >> /etc/hosts
RUN useradd -d /home/sensu -m -s /bin/bash sensu
RUN echo sensu:sensu | chpasswd
RUN echo 'sensu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/sensu
RUN chmod 0440 /etc/sudoers.d/sensu
ADD preparerabbit.sh /tmp/
ADD install-sensu.sh /tmp/
RUN /tmp/install-sensu.sh

ADD start.sh /tmp/start.sh
CMD /tmp/start.sh
