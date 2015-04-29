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
RUN pacman-db-upgrade && pacman -Suy --noconfirm docker

# CMD :
CMD ["sh"]
