FROM alpine

ARG sqluri
ARG public_url
ARG secret
ARG allow_new_users
ARG force_wsgi_environ

WORKDIR /syncserver

# Install packages. Firefox-sync requires python2, and add psycopg2 since we are using postgres, and then build the package. Finally remove packages that are no longer needed after make build
RUN apk add --update --no-cache \
make libstdc++ build-base git python python-dev \
py-psycopg2 py-virtualenv postgresql-dev && \
pip install --upgrade pip && \
git clone https://github.com/mozilla-services/syncserver /syncserver && \
echo psycopg2 >> requirements.txt && \
make build && \
sed -i "s|http://localhost:5000/|$public_url|g" syncserver.ini && \
sed -i "s|workers = 1|workers = 2|g" syncserver.ini && \
sed -i "s|timeout = 30|timeout = 60|g" syncserver.ini && \
sed -i "s|#secret = INSERT_SECRET_KEY_HERE|secret = $secret|g" syncserver.ini && \
sed -i "s|#sqluri = sqlite:////tmp/syncserver.db|sqluri = $sqluri|g" syncserver.ini && \
sed -i "s|# allow_new_users = false|allow_new_users = $allow_new_users|g" syncserver.ini && \
sed -i "s|force_wsgi_environ = false|force_wsgi_environ = $force_wsgi_environ|g" syncserver.ini && \
apk del build-base git py-virtualenv postgresql-dev python-dev

EXPOSE 5000

CMD ["/usr/bin/make", "serve"]
