#!/bin/sh

# more infos on https://gist.github.com/codeinthehole/7ea69f8a21c67cc07293
# https://github.com/boot2docker/boot2docker/issues/678

set -x

SHAREDIR=$HOME/share

# stop boot2docker
boot2docker stop

# creating share folder.
mkdir $SHAREDIR

# mount shared folder while relaunching boot2docker :
boot2docker --vbox-share="$SHAREDIR=share" up
boot2docker ssh "sudo mkdir /share; sudo mount -t vboxsf share /share"


# Pulling archlinux image :
docker pull base/archlinux

# running the container :
docker run  -ti --rm -v /share:/share -v /Users:/Users base/archlinux sh

# umount and remove dir
boot2docker ssh "sudo umount /share; sudo rmdir /share"
