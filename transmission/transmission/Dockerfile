FROM alpine
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apk --no-cache --update add transmission

CMD /usr/bin/transmission-daemon -f --log-error --log-info