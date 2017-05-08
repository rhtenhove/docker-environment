#!/bin/sh

# This script gives the container access to the host xserver

xhost +local:flirone
docker-compose up