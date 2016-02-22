FROM ubuntu
MAINTAINER Vincent Montecot <vmonteco@student.42.fr>

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apt-transport-https ca-certificates zsh docker emacs
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN touch /etc/apt/sources.list.d/docker.list