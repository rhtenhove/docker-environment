# ssh client in Docker

Uses the latest and greatest in alpine packages

Build using docker build ./ -t openssh

add an alias for ssh in your .bashrc:

alias ssh="docker run --rm -ti --net host -v /home/$USER/.ssh:/root/.ssh:ro openssh"

Add `-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY` to use x11 forwarding. For example:

alias ssh="docker run --rm -ti --net host -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY -v /home/$USER/.ssh:/root/.ssh:ro openssh"

Don't forget -X