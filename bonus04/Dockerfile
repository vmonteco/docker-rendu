# Docker vm

# FROM
# 64 bits system :
FROM base/archlinux

# Maintainer :
MAINTAINER Vincent Montecot <vmonteco@student.42.fr>

# Building :
RUN pacman-db-upgrade 
RUN timeout -s 9 10 cat /dev/urandom > /dev/zero || true
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Syy --noconfirm archlinux-keyring
RUN pacman-db-upgrade 
RUN pacman -Suy --noconfirm
RUN pacman-db-upgrade && pacman -Suy --noconfirm docker lxc iptables ca-certificates curl
RUN systemctl enable docker.service

# Install the magic wrapper.
RUN curl https://raw.githubusercontent.com/jpetazzo/dind/master/wrapdocker >> /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Volume :
VOLUME /var/lib/docker

# CMD :
CMD ["wrapdocker"]
