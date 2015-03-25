#!/bin/sh

# Launch boot2docker
boot2docker up

# Get base/archlinux
docker pull base/archlinux

# Building image.
docker build -t hello/world:v42 .

# Launch .
