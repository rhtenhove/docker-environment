#!/bin/bash

PATH=/usr/sbin:/usr/bin:/sbin:/bin

HAPROXYGATEWAY=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.Gateway}}{{end}}' haproxy)
CERTBOTIP=${HAPROXYGATEWAY/.1/.254}
EMAIL=$(head -1 email.txt)

while read FQDN ; do
  docker run --rm -e FQDN -e CERTBOTIP -e EMAIL \
-v letsencrypt:/etc/letsencrypt \
-v letsencryptvar:/var/lib/letsencrypt \
-v letsencryptlog:/var/log/letsencrypt \
--network="haproxy" \
--ip=$CERTBOTIP \
certbot/certbot \
certonly \
--csr /etc/letsencrypt/csr/$FQDN.csr \
--fullchain-path /etc/letsencrypt/csr/$FQDN.crt \
--standalone \
--preferred-challenges http-01 \
--agree-tos \
--no-eff-email \
-m $EMAIL \
-d $FQDN

docker run --rm -e FQDN \
-v letsencrypt:/etc/letsencrypt \
ubuntu:xenial bash -c \
"mkdir /etc/letsencrypt/haproxy ; cat /etc/letsencrypt/keys/$FQDN.key /etc/letsencrypt/csr/$FQDN.crt > /etc/letsencrypt/haproxy/$FQDN.pem"

done <domains.txt
