# docker-environment

This repo is a collection of docker-compose definitions that I use throughout the day. They are based on many different sources of inspiration, and I hope they can be one of yours.


# HTTPS

Haproxy handles SSL termination, and uses certificates generated by certbot and stored in the volume named `letsencrypt`

## Obtaining Let's Encrypt certificates


Setting variables. Make sure you everything below in the same shell instance, since the variables will only available there. So if you need sudo for docker, first do `sudo su`.
```
FQDN=your domain
EMAIL=your e-mail address
```

Then we get a static IP address within the subnet of haproxy for the certbot container. Make sure haproxy is running and has an entry to redirect the http-01 challenge.
```
HAPROXYGATEWAY=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.Gateway}}{{end}}' haproxy)
CERTBOTIP=${HAPROXYGATEWAY/.1/.254}
```

### The Hard Way

Generating a .csr with fancy new EC-crypto stuff. ed25519 will come later. Make sure your https clients support secp384r1 (for example check https://www.ssllabs.com/ssltest/viewMyClient.html)
```
docker run --rm -it -e FQDN \
-v letsencrypt:/etc/letsencrypt \
ubuntu:xenial \
bash -c "apt update && apt install openssl -y && \
openssl req -utf8 -nodes -sha512 -newkey ec:<(openssl ecparam -name secp384r1) -rand /dev/urandom -keyout /etc/letsencrypt/keys/$FQDN.key \
-out /etc/letsencrypt/csr/$FQDN.csr -subj '/C=/ST=/L=/O=/OU=/CN=$FQDN'"
```

Then we get the certificate
```
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
```
Lastly, concatenate the key and fullchain into one file to be used by haproxy
```
docker run --rm -e FQDN -v letsencrypt:/etc/letsencrypt ubuntu:xenial bash -c "mkdir /etc/letsencrypt/haproxy ; cat /etc/letsencrypt/keys/$FQDN.key /etc/letsencrypt/csr/$FQDN.crt > /etc/letsencrypt/haproxy/$FQDN.pem" 
```

### The Easy Way

Just getting an RSA key + certificate.
```
docker run --rm -e FQDN -e CERTBOTIP -e EMAIL \
-v letsencrypt:/etc/letsencrypt \
-v letsencryptvar:/var/lib/letsencrypt \
-v letsencryptlog:/var/log/letsencrypt \
--network="haproxy" \
--ip=$CERTBOTIP \
certbot/certbot \
certonly \
--standalone \
--preferred-challenges http-01 \
--agree-tos \
--no-eff-email \
-m $EMAIL \
-d $FQDN
```

Lastly, concatenate the key and fullchain into one file to be used by haproxy
```
docker run --rm -e FQDN -v letsencrypt:/etc/letsencrypt alpine:latest sh -c "mkdir /etc/letsencrypt/haproxy ; cat /etc/letsencrypt/live/$FQDN/privkey.pem /etc/letsencrypt/live/$FQDN/fullchain.pem > /etc/letsencrypt/haproxy/$FQDN.pem"
```