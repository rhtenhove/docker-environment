#!/bin/sh

# This script gives the container access to the host xserver, and then (builds and) runs the container.

xhost +local:spyder
docker-compose up