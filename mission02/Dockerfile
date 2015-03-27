# Base image
# for x32 systems.
# FROM archlinux
# for x64 systems.
FROM base/archlinux

# Maintainer :
MAINTAINER vincent montecot <vincent.montecot@hotmail.fr>

# Upgrading system.
RUN pacman -Suy --noconfirm && pacman-db-upgrade && pacman -S --noconfirm openssh

# Create user
RUN useradd -m -g users login 

# Changing password
RUN echo 'login:password' | chpasswd

# Copy private key into the container.
COPY ./mykey.pub /home/login/.ssh/mykey.pub

# Copy private key into the authorized_keys file
RUN cat /home/login/.ssh/mykey.pub >> /home/login/.ssh/authorized_keys

# Permissions :
RUN chmod -Rv 755 /home/login
RUN chmod -Rv 600 /home/login/.ssh/authorized_keys

# config ssh :
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Set ssh up.
RUN echo 'root:screencast' | chpasswd
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
#RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ecdsa_key
#RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_ecdsa_key
#RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN systemctl enable sshd
RUN /usr/sbin/sshd

# Choose ports to expose
EXPOSE 42

# Set Entrypoint to start sshd
CMD ["/usr/sbin/sshd", "-D"]