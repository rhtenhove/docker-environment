FROM ubuntu:zesty
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

ADD flir8g-mint.c /flir8g-mint.c

RUN gcc '-I/usr/include/libusb-1.0' -o flir flir8g-mint.c -lusb-1.0 -lm

RUN chmod +x flir

CMD ./flir
