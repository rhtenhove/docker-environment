FROM alpine:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN echo -e "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

RUN apk --no-cache --update add python3 python3-pip nodejs-npm@edge

RUN npm install -g configurable-http-proxy

RUN pip3 install --upgrade jupyterhub notebook

RUN jupyterhub --generate-config

# Installing Docker Spawner

#RUN git clone https://github.com/jupyterhub/dockerspawner.git && \
#cd dockerspawner && \
#pip3 install -r requirements.txt && \
#python setup.py install

EXPOSE 8000

CMD ["jupyterhub", "--no-ssl"]