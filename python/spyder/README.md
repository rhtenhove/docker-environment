# Spyder

### Using an alias

One way to run this is to add an alias to your .bashrc.

First build the container:
`docker build ./spyder -t python-spyder`

Then create a volume to hold the Spyder config file
`docker volume create --name spyder`

Then add the following line to `.bashrc`:

```alias spyderd="xhost +local:spyder && \
docker run -it --rm --name python-spyder -e DISPLAY --device=/dev/dri \
-v /tmp/.X11-unix:/tmp/.X11-unix -v spyder:/root python-spyder && \
xhost -local:spyder"```

Don't forget to `source .bashrc`.

### Running directly

```xhost +local:spyder && \
docker run -it --rm --name python-spyder -e DISPLAY --device=/dev/dri \
-v /tmp/.X11-unix:/tmp/.X11-unix -v spyder:/root python-spyder && \
xhost -local:spyder```

Or just run `./startcontainer.sh`.