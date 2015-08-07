#!/bin/sh

# Launch boot2docker
boot2docker up

# Building image.
docker build -t hello/world:v42 .

# Test.
open http://localhost:8080
open http://192.168.59.103

# sh
docker run -ti -p 80:80 hello/world:v42 /root/start
