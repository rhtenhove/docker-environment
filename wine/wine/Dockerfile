FROM ubuntu:xenial
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apt-get update && apt-get install -y wget apt-transport-https software-properties-common \
libxext-dev libxrender-dev libxtst-dev \
libgl1-mesa-glx libgl1-mesa-dri libgtk2.0-0 libglib2.0-0 libnss3 libx11-6 libasound2 libxtst6 \
libxkbcommon-x11-0 && \

dpkg --add-architecture i386 && \
wget -O- https://dl.winehq.org/wine-builds/Release.key | apt-key add - && \
apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ && \

apt-get update && apt-get install -y winehq-devel && \
rm -rf /var/lib/apt/lists/* && \

wget http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86.msi -P /usr/share/wine/gecko/ && \
wget http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi -P /usr/share/wine/gecko/ && \
wget http://dl.winehq.org/wine/wine-mono/4.7.0/wine-mono-4.7.0.msi -P /usr/share/wine/mono/ && \

apt-get purge -y software-properties-common apt-transport-https && \
apt-get autoremove --purge -y