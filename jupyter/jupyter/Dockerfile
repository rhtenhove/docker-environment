FROM alpine:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apk --no-cache --update add python3 py3-pip build-base python3-dev && \
pip3 install --upgrade pip && \

pip3 install --upgrade jupyter && \

jupyter notebook --generate-config --allow-root && \
apk del build-base python3-dev

CMD ["jupyter", "notebook", "--no-browser", "--allow-root", "--ip='*'"]
