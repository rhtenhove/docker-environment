FROM ubuntu:zesty
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

ENV maltegofilename="MaltegoCE.v4.0.11.9358.deb"

RUN apt-get update && apt-get install -y wget software-properties-common \
libxext-dev libxrender-dev libxtst-dev && \
add-apt-repository ppa:webupd8team/java && \
apt-get purge -y software-properties-common python-software-properties

RUN wget https://www.paterva.com/malv4/community/$maltegofilename

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get update && apt-get install -y oracle-java8-installer

RUN dpkg -i $maltegofilename && \
rm $maltegofilename

CMD maltego_community