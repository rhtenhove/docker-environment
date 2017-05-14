FROM alpine:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apk --no-cache --update add python3 py3-pip build-base python3-dev && \
pip3 install --upgrade pip

RUN pip3 install --upgrade jupyter

RUN jupyter notebook --generate-config --allow-root

ARG PASSWORDHASH

RUN echo "c.NotebookApp.password = u$PASSWORDHASH" >> ~/.jupyter/jupyter_notebook_config.py

RUN apk del build-base python3-dev

EXPOSE 8888

CMD ["jupyter", "notebook", "--no-browser", "--allow-root"]