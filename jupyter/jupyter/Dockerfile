FROM alpine

ARG PERSONAL_PIP_PACKAGES

RUN apk --no-cache --update add python3 py3-pip build-base python3-dev \
libstdc++ && \
pip3 install --upgrade pip && \
pip3 install --upgrade jupyter && \

apk del python3-dev build-base $PERSONAL_PIP_PACKAGES && \

adduser -u 1000 -D jupyter

USER jupyter

RUN mkdir /home/jupyter/notebooks

ADD jupyter_notebook_config.py /home/jupyter/.jupyter/jupyter_notebook_config.py

CMD ["jupyter", "notebook"]
