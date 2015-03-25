# Hello world!!!

# Base image :
FROM base/archlinux

# Maintainer :
MAINTAINER Vincent Montecot <vmonteco@student.42.fr>

# Choose port to expose :

# Building :

RUN pacman-db-upgrade && pacman -Suy --noconfirm apache

# Modifying the prompt :
ENV PS1="login@42born2code:/# "

# Adding default webpage :
RUN echo "Hello World" > /srv/http/index.html