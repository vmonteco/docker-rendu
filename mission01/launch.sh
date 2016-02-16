#!/bin/sh

# Building image.
docker build -t hello/world:v42 .

# Test.
open http://localhost:8080
open http://$(docker-machine ip default)

# sh
docker run -ti -p 80:80 hello/world:v42 /root/start
