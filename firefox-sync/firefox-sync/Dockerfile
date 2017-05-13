FROM alpine:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

ARG sqluri
ARG public_url
ARG secret
ARG allow_new_users
ARG force_wsgi_environ

# Install packages
RUN apk add --update --no-cache \
    git python python-dev build-base \
    py-psycopg2 py-virtualenv postgresql-dev && \
    pip install --upgrade pip
    
# Build firefox-sync (clone to /syncserver) and add psycopg2 since we are using postgres
RUN git clone https://github.com/mozilla-services/syncserver && \
cd /syncserver && \
echo psycopg2 >> requirements.txt && \
make build
    
RUN cd /syncserver && \
sed -i "s|http://localhost:5000/|$public_url|g" syncserver.ini && \
sed -i "s|workers = 1|workers = 2|g" syncserver.ini && \
sed -i "s|timeout = 30|timeout = 60|g" syncserver.ini && \
sed -i "s|#secret = INSERT_SECRET_KEY_HERE|secret = $secret|g" syncserver.ini && \
sed -i "s|#sqluri = sqlite:////tmp/syncserver.db|sqluri = $sqluri|g" syncserver.ini && \
sed -i "s|# allow_new_users = false|allow_new_users = $allow_new_users|g" syncserver.ini && \
sed -i "s|force_wsgi_environ = false|force_wsgi_environ = $force_wsgi_environ|g" syncserver.ini

EXPOSE 5000

CMD ["/usr/bin/make", "serve"]
