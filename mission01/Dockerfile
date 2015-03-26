# Hello world!!!

# Base image :
# For x32 systems.
FROM archlinux
# For x64 systems.
# FROM base/archlinux

# Maintainer :
MAINTAINER Vincent Montecot <vmonteco@student.42.fr>

# Choose port to expose :

# Building :

RUN pacman-db-upgrade && pacman -Suy --noconfirm apache emacs

# Expose ports :
EXPOSE 80

# Modifying the prompt :
ENV PS1="login@42born2code:/# "

# Adding default webpage :
RUN echo "Hello World" > /srv/http/index.html
RUN echo "ServerName 192.168.59.103" >> /etc/httpd/conf/httpd.conf
RUN systemctl enable httpd
# ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]