FROM ubuntu:zesty
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

#RUN apt-get update && apt-get install -y wget

#RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ zesty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add

ENV SUDO_FORCE_REMOVE=yes
ENV CYRUSLIBS=/usr/local/cyruslibs
ENV PKG_CONFIG_PATH="$CYRUSLIBS/lib/pkgconfig:$PKG_CONFIG_PATH"
ENV LDFLAGS="-Wl,-rpath,$CYRUSLIBS/lib -Wl,-rpath,$CYRUSLIBS/lib/x86_64-linux-gnu"
ENV PATH="$CYRUSLIBS/bin:${PATH}"

RUN apt-get update && apt-get install -y git build-essential autoconf automake libtool wget \
pkg-config bison flex libssl-dev libjansson-dev libxml2-dev \
libsqlite3-dev libical-dev libsasl2-dev libpcre3-dev uuid-dev \
libicu-dev libxapian-dev libcunit1-dev libperl-dev valgrind libsasl2-modules sasl2-bin \
libsasl2-modules-gssapi-mit libpq-dev libical-dev libxml2-dev libsnmp-dev zlib1g-dev \
libnghttp2-dev sudo libbsd-dev libmilter-dev cmake libglib2.0-dev python-docutils \
php-cli php-curl bash-completion comerr-dev g++ gperf groff heimdal-dev vim-common wamerican \
graphviz doxygen help2man libmagic-dev tcl

# Get all dependencies and build them
RUN git clone https://github.com/cyrusimap/cyruslibs.git && \
cd /cyruslibs && \
sh ./build.sh

# Build Cyrus IMAP
RUN git clone https://github.com/cyrusimap/cyrus-imapd.git && \
cd cyrus-imapd && \
autoreconf -i && \
./configure --enable-http --enable-calalarmd --enable-xapian --with-brotli --with-shapelib && \
make && \
make install

ENV MAILDOMAIN hoveict.nl

# Install postfix
RUN apt-get update && apt-get install -y postfix

# Configure postfix
ADD postfix.main.cf /etc/postfix/main.cf

# Enable services
RUN service saslauthd enable && \
service postfix enable && \
service cyrus-imapd enable

#RUN apt-get purge -y pkg-config bison flex libssl-dev libjansson-dev libxml2-dev git build-essential \
#autoconf automake libtool libsqlite3-dev libical-dev libsasl2-dev libpcre3-dev uuid-dev libicu-dev \
#libxapian-dev libcunit1-dev libperl-dev valgrind libsasl2-modules \
#libsasl2-modules-gssapi-mit libpq-dev libical-dev libxml2-dev libsnmp-dev zlib1g-dev \
#libnghttp2-dev sudo libbsd-dev libmilter-dev cmake libglib2.0-dev python-docutils \
#doxygen help2man libmagic-dev tcl graphviz vim-common $(apt-mark showauto) && \
#apt-get autoremove --purge -y
