#!/bin/sh

if [[ $(boot2docker status) == "poweroff" ]]; then
	boot2docker up
else
	echo "boot2docker is already running."
fi

./launch.sh

echo "Shutting boot2docker down..."
boot2docker down
echo "boot2docker is now down."