FROM ubuntu:xenial
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apt-get update && apt-get install -y build-essential git make

RUN git clone git://git.openssl.org/openssl.git

WORKDIR /openssl

RUN ./Configure linux-x86_64 -Wl,-rpath=/usr/local/lib64 \
--prefix=/usr/local --openssldir=/usr/local && \
make && \
make install

ENTRYPOINT openssl