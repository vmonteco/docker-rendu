#!/bin/sh

# more infos on https://gist.github.com/codeinthehole/7ea69f8a21c67cc07293
# https://github.com/boot2docker/boot2docker/issues/678

#set -x

SHAREDIR=$HOME/share
MACHINE=default
IMAGE=volume42

# stop docker machine
if [[ $(docker-machine status $MACHINE) == "Running" ]]; then
	echo "Shutting docker machine down."
	docker-machine stop $MACHINE
	echo "Docker machine is now down."
else
	echo "Docker machine already down."
fi

# creating share folder.
mkdir $SHAREDIR

# Add directory to VM :
VBoxManage sharedfolder add $MACHINE --name share --hostpath $SHAREDIR

# mount shared folder while relaunching docker machine :
echo "restarting docker machine."
docker-machine start $MACHINE
echo "docker machine restarted."
echo "Creating and mounting \"share\" directory in docker machine VM."
docker-machine ssh $MACHINE "sudo mkdir /share; sudo mount -t vboxsf share /share"
echo "\"share\" directory created and mounted in boot2docker VM."

# Pulling archlinux image :
echo "Pulling base/archlinux image."
docker pull base/archlinux

#building image :
docker build -t $IMAGE .

# running the container :
echo "Running base/archlinux."
docker run  -ti --rm -v /share:/share $IMAGE sh

# umount and remove dir
echo "Unmounting and removing shared directory from docker-machine VM."
docker-machine ssh $MACHINE "sudo umount /share; sudo rmdir /share"

echo "Shutting docker-machine down."
docker-machine stop $MACHINE
echo "docker-machine is now down."