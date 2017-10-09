FROM alpine

ARG PGADMIN_VERSION_MAJOR
ARG PGADMIN_VERSION_MINOR
ARG PGADMIN_SETUP_EMAIL
ARG PGADMIN_SETUP_PASSWORD

RUN apk add --update --no-cache postgresql-dev postgresql-libs build-base python3 python3-dev && \
echo "https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${PGADMIN_VERSION_MAJOR}.${PGADMIN_VERSION_MINOR}/pip/pgadmin4-${PGADMIN_VERSION_MAJOR}.${PGADMIN_VERSION_MINOR}-py2.py3-none-any.whl" > requirements.txt \
&& pip3 install -r requirements.txt && \
apk del musl-dev build-base

RUN mkdir -p /var/log/pgadmin4 /var/lib/pgadmin4/sessions /var/lib/pgadmin4/storage

RUN echo -e "SERVER_MODE = True\n\
DEFAULT_SERVER = '0.0.0.0'\n\
LOG_FILE = '/var/log/pgadmin4/pgadmin4.log'\n\
SQLITE_PATH = '/var/lib/pgadmin4/pgadmin4.db'\n\
SESSION_DB_PATH = '/var/lib/pgadmin4/sessions'\n\
STORAGE_DIR = '/var/lib/pgadmin4/storage'" \
>> /usr/lib/python3.6/site-packages/pgadmin4/config_local.py

RUN python3 /usr/lib/python3.6/site-packages/pgadmin4/setup.py

EXPOSE 5050

VOLUME /var/lib/pgadmin4

CMD ["python3", "/usr/local/lib/python3.6/site-packages/pgadmin4/pgAdmin4.py"]
