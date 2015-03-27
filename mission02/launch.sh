#!/bin/sh

# Create ssh-key :
ssh-keygen -f mykey -P ""

# Build image :
docker build -t docker/mission02:ssh .

# Launch image with a terminal.
docker run -p 22:42 -d docker/mission02:ssh

# boot2docker ssh tunneling.
boot2docker ssh -L 10022:localhost:22