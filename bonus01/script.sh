#!/bin/zsh

set -x

MACHINE=$1
PATH1=$2
PATH2=$3
DOCKER_CONF_PATH=$HOME/.docker/machine/machines/default/default/default.vbox

# how to use a different volume/directory to host the boot2docker VM
#mkdir ~/.boot2docker
#echo "Dir = "$1 > ~/.boot2docker/profile

# stop docker machine
#if [[ $(docker-machine status $MACHINE) == "Running" ]]; then
#	echo "Stopping docker machine";
#	docker-machine stop $MACHINE;
#	echo "Docker machine stopped";
#else
#	echo "docker machine already down";
#fi

# Stop VirtualBox

# Move virtual disk
mv $PATH1 $PATH2

# Change disk-name in VBoxConf :
sed -i _backup 's#$PATH1#$PATH2#' $DOCKER_CONF_PATH

# restart virtualbox
#virtualbox &

# restart docker-machine
#docker-machine start $MACHINE
#eval '$(docker-machine env $MACHINE)'
