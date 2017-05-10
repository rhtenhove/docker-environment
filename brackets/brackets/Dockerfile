FROM ubuntu:zesty
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

ENV MAJORVERSION=1
ENV MINORVERSION=9

RUN apt-get update && apt-get install -y wget chromium-browser libcurl3 libpango1.0-0 libcanberra-gtk-module

RUN wget https://github.com/adobe/brackets/releases/download/release-$MAJORVERSION.$MINORVERSION/Brackets.Release.$MAJORVERSION.$MINORVERSION.64-bit.deb && \
wget http://launchpadlibrarian.net/160013007/libgcrypt11_1.5.3-2ubuntu4_amd64.deb

RUN dpkg -i libgcrypt11_1.5.3-2ubuntu4_amd64.deb && \
dpkg -i Brackets.Release.$MAJORVERSION.$MINORVERSION.64-bit.deb

CMD ["brackets"]