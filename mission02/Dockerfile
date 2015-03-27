# Base image
# for x32 systems.
# FROM archlinux
# for x64 systems.
FROM base/archlinux

# Maintainer :
MAINTAINER vincent montecot <vincent.montecot@hotmail.fr>

# Upgrading system.
RUN pacman -Suy --noconfirm && pacman-db-upgrade && pacman -S --noconfirm openssh

# Set ssh up.
RUN systemctl enable sshd

# Create user
RUN useradd -m -g users login 

# Copy private key into the container.
COPY ./mykey.pub /home/login/.ssh/mykey.pub

# Copy private key into the authorized_keys file
RUN cat /home/login/.ssh/mykey.pub >> /home/login/.ssh/authorized_keys

# Choose ports to expose
EXPOSE 42

# Set Entrypoint to start sshd
CMD ["/usr/sbin/sshd", "-DFOREGROUND"]