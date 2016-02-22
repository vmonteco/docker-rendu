#!/bin/zsh

set -x

SHAREDIR=$(pwd)
MACHINE=default
IMAGE=bonus03

# Stop docker machine
if [[ $(docker-machine status $MACHINE) == "Running" ]]; then
	docker-machine stop $MACHINE;
fi

VBoxManage sharedfolder add $MACHINE --name $IMAGE --hostpath $SHAREDIR

docker-machine start $MACHINE
docker-machine ssh $MACHINE "sudo mkdir /$IMAGE; sudo mount -t vboxsf $IMAGE /$IMAGE"
docker-machine ssh $MACHINE

./build.sh $IMAGE
./launch-preprod.sh $IMAGE

docker-machine ssh $MACHINE

docker-machine ssh $MACHINE "sudo umount $IMAGE; sudo rmdir /$IMAGE"

docker-machine stop $MACHINE

VBoxManage sharedfolder remove default --name $IMAGE

docker-machine start $MACHINE