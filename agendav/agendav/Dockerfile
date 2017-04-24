FROM alpine:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

# Add edge tagged repository to install nodejs-npm since thats not (yet) available in main repository
RUN echo -e "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

RUN apk --update --no-cache add apache2 git curl \
php7 php7-apache2 php7-pgsql php7-mcrypt php7-curl php7-ctype php7-mbstring php7-pdo_pgsql php7-json php7-phar php7-openssl php7-dom php7-iconv php7-xmlreader php7-zlib php7-session \
nodejs-npm@edge \
tzdata openntpd

RUN cd /var/www && \
git clone --branch develop https://github.com/agendav/agendav.git && \
cd agendav/web && \
curl -s https://getcomposer.org/installer | php7 && \
php7 composer.phar install && \
chown -R root:apache /var/www/agendav/web/var

# Create symlinks to ensure AgenDAV scripts can directly access php and composer binaries
RUN ln -s /var/www/agendav/web/composer.phar /usr/local/bin/composer && \
ln -s /usr/bin/php7 /usr/bin/php

# Allow root so the default user (root) can install the packages run by the bower script
RUN echo '{ "allow_root": true }' > /root/.bowerrc

RUN cd /var/www/agendav && \
npm install && \
npm run build

ARG dbhost
ARG dbname
ARG dbport
ARG dbuser
ARG dbpassword
ARG TIMEZONE

ADD ./settings.php /var/www/agendav/web/config/settings.php

# Set permissions
RUN chown -R root:apache /var/www/agendav/web && \
chmod -R 770 /var/www/agendav/web/var

# Enable rewrite module
RUN sed -i "s|#LoadModule rewrite_module modules/mod_rewrite.so|LoadModule rewrite_module modules/mod_rewrite.so|g" /etc/apache2/httpd.conf

# Clean up after build
RUN apk del git curl && \
rm /root/.bowerrc

# Set timezone for container
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
echo $TIMEZONE > /etc/timezone && \
echo -e "date.timezone = $TIMEZONE" >> /etc/php7/php.ini

ARG domainname

ADD ./agendav.conf /etc/apache2/conf.d/agendav.conf

# Set (global) servername
RUN echo "ServerName $domainname" >> /etc/apache2/httpd.conf && \
sed -i "s|agendav.example.nl|$domainname|g" /etc/apache2/conf.d/agendav.conf

# Create dir for httpd to create a .pid
RUN mkdir /run/apache2

# Create startup script
RUN echo -e "ntpd -S\n\
httpd -DFOREGROUND" >> /usr/local/bin/startup.sh && \
chmod 700 /usr/local/bin/startup.sh

EXPOSE 80

CMD /usr/local/bin/startup.sh
