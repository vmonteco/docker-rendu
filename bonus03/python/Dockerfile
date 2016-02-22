FROM base/archlinux
MAINTAINER Vincent Montecot <vmonteco@student.42.fr>

# Building :
RUN pacman-db-upgrade
RUN timeout -s 9 10 cat /dev/urandom > /dev/zero || true
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Syy --noconfirm archlinux-keyring
RUN pacman-db-upgrade
RUN pacman -Suy --noconfirm
RUN pacman-db-upgrade && pacman -Suy --noconfirm base base-devel emacs zsh python3 python-pip apache sqlite3 \
    git libjpeg-turbo

RUN pip install mod_wsgi

RUN git clone https://github.com/GrahamDumpleton/mod_wsgi.git
RUN cd mod_wsgi && ./configure --with-python=$(which python) &&  make && make install
RUN cd && rm -rf /mod_wsgi

# PORTS :
EXPOSE 80

# Volumes :
# logs
VOLUME /srv/http/www/logs
# Other files :
RUN mkdir /srv/http/www/data
RUN chmod -Rv http /srv/http/www/data
RUN chmod -Rv 700 /srv/http/data
# Sources :
VOLUME /srv/http/www/htdocs

# Disable debug mode :