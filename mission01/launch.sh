#!/bin/sh

# Building image.
docker build -t hello/world:v42 .

# Test.
open http://localhost:8080
open http://$(docker-machine ip default):8080

# sh
docker run -ti -u login -h "42born2code" -p 8080:10080 hello/world:v42 /home/login/start
