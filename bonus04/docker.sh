#!/bin/sh

#build docker image :
docker build -t dockerimage .

# run :
docker run dockerimage