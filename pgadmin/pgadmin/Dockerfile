FROM python:alpine
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apk add --update --no-cache postgresql-dev postgresql-libs build-base apache2 apache2-utils apache2-mod-wsgi

ARG PGADMIN_VERSION_MAJOR=1
ARG PGADMIN_VERSION_MINOR=4

RUN echo "https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${PGADMIN_VERSION_MAJOR}.${PGADMIN_VERSION_MINOR}/pip/pgadmin4-${PGADMIN_VERSION_MAJOR}.${PGADMIN_VERSION_MINOR}-py2.py3-none-any.whl" > requirements.txt \
&& pip install --upgrade pip \
&& pip install -r requirements.txt

RUN mkdir -p /var/log/pgadmin4 /var/lib/pgadmin4/sessions /var/lib/pgadmin4/storage

RUN echo -e "SERVER_MODE = True\n\
DEFAULT_SERVER = '0.0.0.0'\n\
LOG_FILE = '/var/log/pgadmin4/pgadmin4.log'\n\
SQLITE_PATH = '/var/lib/pgadmin4/pgadmin4.db'\n\
SESSION_DB_PATH = '/var/lib/pgadmin4/sessions'\n\
STORAGE_DIR = '/var/lib/pgadmin4/storage'" \
>> /usr/local/lib/python3.6/site-packages/pgadmin4/config_local.py

ADD pgadmin.conf /etc/apache2/conf.d/pgadmin.conf

ARG PGADMIN_SETUP_EMAIL
ARG PGADMIN_SETUP_PASSWORD

#ENV PGADMIN_SETUP_EMAIL $PGADMIN_SETUP_EMAIL
#ENV PGADMIN_SETUP_PASSWORD $PGADMIN_SETUP_PASSWORD

# Create configuration database
RUN python /usr/local/lib/python3.6/site-packages/pgadmin4/setup.py

# Set permissions
RUN chown -R root:apache /var/log/pgadmin4 && \
chown -R root:apache /var/lib/pgadmin4

ARG public_url

RUN sed -i "s|pgadmin.example.com|$public_url|g" /etc/apache2/conf.d/pgadmin.conf

# Clean up
RUN apk del musl-dev build-base

EXPOSE 5050

VOLUME /var/lib/pgadmin4

CMD ["python", "/usr/local/lib/python3.6/site-packages/pgadmin4/pgAdmin4.py"]
