FROM python:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apt-get update && apt-get install -y build-essential libxml2 && \
pip install Scrapy && \
apt-get purge -y build-essential && \
apt-get autoremove --purge -y

CMD python
