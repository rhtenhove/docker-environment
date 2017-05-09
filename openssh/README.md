# ssh client in Docker

Uses the latest and greatest in alpine packages.

Build using `docker build ./ -t openssh`.

Add an alias for ssh in your .bashrc:

`alias ssh="docker run --rm -ti --net host -v /home/$USER/.ssh:/root/.ssh:ro openssh"`
* You can also use a different alias, such as sshd, to still have the default ssh available.

Then reload using `source ~/.bashrc`.

## Using X11 forwarding
First add the hostname of this container to the allowed hostnames to connect to the X server using `xhost +local:openssh`

Then add `-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY` to the docker run command. For example:
`alias ssh="docker run --rm -ti --net host -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY -v /home/$USER/.ssh:/root/.ssh:ro openssh"`

Don't forget `-X` in your ssh command to enable it for your session, and also make sure the server you're connecting to has X11 forwarding enabled.