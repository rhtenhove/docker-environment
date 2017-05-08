FROM alpine:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apk --update --no-cache add git wget build-base perl m4 graphviz \
doxygen help2man python3 py2-pip icu-dev

# Get all dependencies and build them
RUN git clone https://github.com/cyrusimap/cyruslibs.git && \
cd /cyruslibs && \
sh ./build.sh

# Build Cyrus IMAP
RUN git clone https://github.com/cyrusimap/cyrus-imapd.git && \
autoreconf -i && \
./configure && \
make && \
make install

RUN apk del git wget build-base py2-pip