#!/bin/sh

# more infos on https://gist.github.com/codeinthehole/7ea69f8a21c67cc07293
# https://github.com/boot2docker/boot2docker/issues/678

# stop boot2docker
boot2docker stop

# creating share folder.
mkdir ~/share

# mount shared folder while relaunching boot2docker :
boot2docker --vbox-share="/nfs/zfs-student-5/users/2013_paris/vmonteco/share=share:/Users=users" up
boot2docker ssh "sudo mkdir /share; sudo mount -t vboxsf share /share"
boot2docker ssh "sudo mkdir /Users; sudo mount -t vboxsf users /Users"

# Pulling archlinux image :
docker pull base/archlinux

# building
# docker build -t volumes .

# running the container :
docker run  -ti --rm -v /share:/share -v /Users:/Users base/archlinux sh

# umount and remove dir
boot2docker ssh "sudo umount /share; sudo rmdir /share"
