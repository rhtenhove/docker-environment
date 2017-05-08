FROM python:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apt-get update && apt-get install -y libxext-dev libxrender-dev libxtst-dev \
libgl1-mesa-glx libgl1-mesa-dri libgtk2.0-0 libglib2.0-0 libnss3 libx11-6 libasound2 libxtst6 \
libxkbcommon-x11-0

RUN pip install spyder PyQt5

CMD spyder3