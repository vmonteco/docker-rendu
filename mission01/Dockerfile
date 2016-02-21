# Hello world!!!

# Base image :
# For x32 systems.
# FROM archlinux
# For x64 systems.
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
RUN pacman-db-upgrade && pacman -Suy --noconfirm apache emacs zsh lynx gdb emacs sudo

# Expose ports :
EXPOSE 10080

# adding group and user
RUN useradd -m -g users -G http login
RUN echo 'login:password' | chpasswd
RUN touch /home/login/.zshrc
RUN chsh -s /usr/bin/zsh
RUN echo "login ALL=(ALL) ALL" >> /etc/sudoers

# Modifying the prompt :
ENV PS1="%n@%m:/# "

# Conf apache :
RUN touch /home/login/error_log /home/login/access_log
RUN chown login /home/login/error_log /home/login/access_log
RUN sed -i 's/Listen 80/Listen 10080/g' /etc/httpd/conf/httpd.conf
RUN sed -i 's/User http/User login/g' /etc/httpd/conf/httpd.conf
RUN sed -i 's/ErrorLog "\/var\/log\/httpd\/error_log"/ErrorLog "\/home\/login\/error_log"/g' /etc/httpd/conf/httpd.conf
RUN sed -i 's/CustomLog "\/var\/log\/httpd\/access_log" common/CustomLog "\/home\/login\/access_log" common/g' /etc/httpd/conf/httpd.conf
RUN echo "ServerName 192.168.59.103" >> /etc/httpd/conf/httpd.conf

# Adding default webpage :
RUN echo "Hello World" > /srv/http/index.html
RUN systemctl enable httpd

# ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
#RUN echo "#!/usr/bin/zsh" >> /root/start
#RUN echo "httpd -DFOREGROUND &; zsh" >> /root/start
RUN echo "#!/usr/bin/zsh" >> /home/login/start
RUN echo "echo 'password' | sudo -S httpd -DFOREGROUND &; zsh" >> /home/login/start
RUN chmod +x /home/login/start
# CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
