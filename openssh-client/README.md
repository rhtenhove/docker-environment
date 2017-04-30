# ssh client in Docker

Uses the latest and greatest in alpine packages

add an alias for ssh in your .bashrc:

alias ssh="docker run --rm -ti --net host -v /home/$USER/.ssh:/root/.ssh:ro openssh-client"