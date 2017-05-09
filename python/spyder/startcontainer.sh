#!/bin/sh

# First move the working directory to the directory of this script, so this can be run from anywhere.
cd "$(dirname "$0")"

# Then give any machine with the hostname spyder access to the X11 socket.
xhost +local:spyder

# Start the container and attach to it.
docker-compose up

# Revoke access to the X11 socket when the script stops (ie. spyder is closed and the container ends).
xhost -local:spyder
