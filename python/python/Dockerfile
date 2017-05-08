FROM python:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN pip install lxml pyarango python-libnmap xmltodict spyder PyQt5

RUN apt-get update && apt-get install -y libgl1-mesa-glx libgl1-mesa-dri

RUN apt-get update && apt-get install -y libgtk2.0-0 libglib2.0-0 libnss3 libx11-6

RUN apt-get update && apt-get install -y libasound2 libxtst6

CMD spyder3