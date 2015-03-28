#!/bin/sh

# Launch boot2docker :
boot2docker up

# Pulling archlinux image :
docker pull base/archlinux

mkdir volume

docker build -t volumes .

# running the container :
docker run --rm -ti -v $(pwd)/volume:/volume volumes sh