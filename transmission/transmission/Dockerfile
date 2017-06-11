FROM alpine
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apk --no-cache --update add transmission-daemon

ADD settings.json /root/.config/transmission-daemon/settings.json

CMD /usr/bin/transmission-daemon -f --log-error --log-info