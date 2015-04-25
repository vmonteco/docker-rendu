# Hello world!!!

# Base image :
# For x32 systems.
# FROM archlinux
# For x64 systems.
FROM base/archlinux

# Maintainer :
MAINTAINER Vincent Montecot <vmonteco@student.42.fr>

# Choose port to expose :

# Building :
RUN pacman-db-upgrade 
RUN timeout -s 9 10 cat /dev/urandom > /dev/zero || true
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Syy --noconfirm archlinux-keyring
RUN pacman-db-upgrade 
RUN pacman -Suy --noconfirm
RUN pacman-db-upgrade && pacman -Suy --noconfirm apache emacs zsh lynx

# Expose ports :
EXPOSE 80

# Modifying the prompt :
ENV PS1="login@42born2code:/# "

# Adding default webpage :
RUN echo "Hello World" > /srv/http/index.html
RUN echo "ServerName 192.168.59.103" >> /etc/httpd/conf/httpd.conf
RUN systemctl enable httpd
RUN chsh -s /usr/bin/zsh
# ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
RUN echo "#!/usr/bin/zsh" >> /root/start
RUN echo "httpd -DFOREGROUND &; zsh" >> /root/start
RUN chmod +x /root/start
# CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
