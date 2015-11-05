#!/bin/sh

# Launch boot2docker
if [[ $(boot2docker status) == "poweroff" ]]; then
	boot2docker up
else
	echo "boot2docker is already running."
fi

./launch.sh

# also run tunnel.sh

echo "Shutting boot2docker down..."
boot2docker down
echo "boot2docker is now down."