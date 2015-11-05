# Base image
# for x32 systems.
# FROM archlinux
# for x64 systems.
FROM base/archlinux

# Maintainer :
MAINTAINER vincent montecot <vincent.montecot@hotmail.fr>

# Upgrading system.
RUN pacman-db-upgrade 
RUN timeout -s 9 10 cat /dev/urandom > /dev/zero || true
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Syy --noconfirm archlinux-keyring
RUN pacman-db-upgrade 
RUN pacman -Suy --noconfirm && pacman-db-upgrade && pacman -S --noconfirm openssh

# Create user
RUN useradd -m -g users login 

# Changing password
RUN echo 'login:password' | chpasswd
RUN echo 'root:password' | chpasswd

# Copy private key into the container.
COPY ./mykey.pub /home/login/.ssh/mykey.pub

# Copy private key into the authorized_keys file
RUN cat /home/login/.ssh/mykey.pub >> /home/login/.ssh/authorized_keys

# Permissions :
RUN chmod -Rv 755 /home/login
RUN chmod -Rv 600 /home/login/.ssh/authorized_keys
RUN chown -Rv login /home/login

# config ssh :
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Set ssh up.
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
RUN sed -i 's/#Port 22/Port 42/g' /etc/ssh/sshd_config
RUN systemctl enable sshd
# disable PAM
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

#RUN /usr/sbin/sshd

# Choose ports to expose
EXPOSE 42

# Set Entrypoint/cmd to start sshd
CMD ["/usr/sbin/sshd", "-D"]