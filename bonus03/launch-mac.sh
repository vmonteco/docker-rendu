#!/bin/zsh

SHAREDIR=$(pwd)
MACHINE=default
IMAGE=bonus03

# Stop docker machine
if [[ $(docker-machine status $MACHINE) == "Running" ]]; then
	docker-machine stop $MACHINE;
fi

VBoxManage sharedfolder add $MACHINE --name $IMAGE --hostpath /$SHAREDIR

docker-machine start $MACHINE
docker-machine ssh $MACHINE "sudo mkdir /$IMAGE; sudo mount -t vboxsf $IMAGE /IMAGE"

./build.sh $IMAGE
./launch.sh $IMAGE

docker-machine ssh $MACHINE "sudo umount /$IMAGE; sudo rmdir /$IMAGE"

docker-machine stop $MACHINE

VBox sharedfolder remove default --name $IMAGE