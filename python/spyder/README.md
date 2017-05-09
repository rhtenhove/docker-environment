# Spyder

### Using an alias

One way to run this is to add an alias to your .bashrc.

First build the container:

`docker build ./spyder -t python-spyder`

Then add the following line to `.bashrc`:

```alias spyderd="xhost +local:spyder && docker run -it -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix python-spyder && xhost -local:spyder"```

Don't forget to `source .bashrc`.

### Running directly

Just run `./startcontainer.sh`.