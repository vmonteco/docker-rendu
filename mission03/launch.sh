#!/bin/sh

# more infos on https://gist.github.com/codeinthehole/7ea69f8a21c67cc07293


# stop boot2docker
boot2docker stop

mkdir ~/share

# mount shared folder
VBoxManage sharedfolder add boot2docker-vm --name /share --hostpath ~/share
# relaunch boot2docker :
boot2docker up

# Pulling archlinux image :
docker pull base/archlinux

# volume to mount to VM
mkdir ~/volume

# mounting this volume :
boot2docker ssh "sudo mount -t vboxsf -o uid=1000,gid=50 /nfs/zfs-student-5/users/2013_paris/vmonteco/share /share"
# "tce-load -wi sshfs-fuse ; mkdir /volume ; sudo sshfs vmonteco@localhost:/volume /nfs/zfs-student-5/users/2013_paris/vmonteco/volume"


# Volume tou mount to container :
mkdir ~/volume/test

docker build -t volumes .

# running the container :
docker run  -ti --rm -v $(pwd)/volume/test:/volume --name myvolume volumes sh
#docker run --rm -v $(pwd)/volume:/volume volumes myvolume
#docker run --rm -ti -v /Users$(pwd)/volume:/volume volumes sh