#!/bin/sh

# Delete ~/.ssh/known_hosts
rm ~/.ssh/known_hosts

# Create ssh-key :
ssh-keygen -f mykey -P ""

# Build image :
docker build -t docker/mission02:ssh .

# Launch image with a terminal.
docker run -p 10022:42 -d docker/mission02:ssh

# boot2docker ssh tunneling.
# boot2docker ssh -L 10022:localhost:10022

# docker-machine ssh tunneling.
docker-machine ssh default -L 10022:localhost:10022