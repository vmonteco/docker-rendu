#!/bin/sh

# Launch boot2docker
boot2docker up

# Localhost port forwarding (ssh tunnelng) :
# boot2docker ssh -L 8080:localhost:80 &

# Get base/archlinux
#NB : Useless.
#docker pull base/archlinux

# Building image.
docker build -t hello/world:v42 .

# Launch .
# webserver
docker run -d -p 80:80 hello/world:v42
# ssh tunnelng
boot2docker ssh -L 8080:localhost:80 &

# Test.
open http://localhost:8080

# sh
docker run -ti -P hello/world:v42 sh
