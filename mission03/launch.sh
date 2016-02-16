#!/bin/sh

# more infos on https://gist.github.com/codeinthehole/7ea69f8a21c67cc07293
# https://github.com/boot2docker/boot2docker/issues/678

set -x

SHAREDIR=$HOME/share
#MACHINE="default"

# stop boot2docker
#if [[ $(docker-machine status $MACHINE) == "Running" ]]; then
#	echo "Shutting docker-machine killed."
#	docker-machine kill $MACHINE
#	echo "docker machine is now killed."
#else
#	echo "docker machine already killed."
#fi

# creating share folder.
mkdir $SHAREDIR

# mount shared folder while relaunching boot2docker :
#echo "restarting docker machine."
#boot2docker --vbox-share="$SHAREDIR=share" up
#echo "docker machine restarted."
#echo "Creating and mounting \"share\" directory in boot2docker VM."
#boot2docker ssh "sudo mkdir /share; sudo mount -t vboxsf share /share"
#echo "\"share\" directory created and mounted in boot2docker VM."

# Pulling archlinux image :
#echo "Pulling base/archlinux image."
docker pull base/archlinux

# running the container :
#echo "Running base/archlinux."
docker run  -ti --rm -v $SHAREDIR:/share -v /Users:/Users base/archlinux sh

# umount and remove dir
#echo "Unmounting and removing shared directory from boot2docker VM."
#docker-machine default ssh "sudo umount /share; sudo rmdir /share"

#echo "Shutting boot2docker down."
#boot2docker down
#echo "boot2docker is now down."