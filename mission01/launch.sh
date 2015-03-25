#!/bin/sh

# Localhost port forwarding (ssh tunnelng) :
boot2docker ssh -L 8080:localhost:80

# Launch boot2docker
boot2docker up

# Get base/archlinux
docker pull base/archlinux

# Building image.
docker build -t hello/world:v42 .

# Launch .
