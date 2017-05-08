#!/bin/sh

# This script gives the container access to the host xserver

#docker-compose create
#xhost +local:`docker inspect --format='{{ .Config.Hostname }}' maltego`
xhost +local:maltego
#docker-compose start -d
docker-compose up -d