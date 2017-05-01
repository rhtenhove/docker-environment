# ssh client in Docker

Uses the latest and greatest in alpine packages

add an alias for ssh in your .bashrc:

alias ssh="docker run --rm -ti --net host -v /home/$USER/.ssh:/root/.ssh:ro openssh-client"

Add `-v /tmp/.X11-unix:/tmp/.X11-unix:ro` to use x11 forwarding. For example:

alias ssh="docker run --rm -ti --net host -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /home/$USER/.ssh:/root/.ssh:ro openssh-client"

Don't forget -X