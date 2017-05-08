FROM ubuntu:xenial
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apt-get update && apt-get install -y git g++ \
libusb-1.0-0-dev linux-headers-generic v4l-utils \
guvcview mplayer

WORKDIR /flirone

ADD flir8g-mint.c /flirone/flir8g-mint.c

RUN git clone https://github.com/umlaeute/v4l2loopback \
&& cd v4l2loopback \
&& make && make install

RUN gcc '-I/usr/include/libusb-1.0' -o flir1 flir8g-mint.c -lusb-1.0 -lm

RUN ./flir