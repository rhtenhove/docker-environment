FROM alpine:latest
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apk --update --no-cache add apache2 git \
# php7 doesnt work (yet) with the awl libraries required for davical
php5 php5-pgsql php5-imap php5-curl php5-cgi php5-xml php5-apache2 php5-gettext php5-pdo_pgsql php5-iconv php5-calendar \
tzdata openntpd \
perl-yaml perl-dbi perl-dbd-pg

WORKDIR /usr/share

RUN git clone https://gitlab.com/davical-project/davical.git && \
git clone https://gitlab.com/davical-project/awl.git

ARG dbhost
ARG dbname
ARG dbport
ARG dbuser
ARG dbpassword
ARG adminemail
ARG domainname
ARG locale

RUN mkdir /etc/davical && \
echo -e "<?php\n\
\$c->domain_name = '$domainname';\n\
\$c->db_connect[] = array( 'dsn' => 'pgsql:dbname=$dbname port=$dbport host=$dbhost', 'dbuser' => '$dbuser', 'dbpass' => '$dbpassword' );\n\
\$c->admin_email ='$adminemail';\n\
\$c->readonly_webdav_collections = false;\n\
\$c->writable_dav_collections = true;\n\
\$c->get_includes_subcollections = true;\n\
\$c->restrict_setup_to_admin = true;\n\
\$c->default_locale = '$locale';\n\
\$c->trust_x_forwarded = true;\n\
\$c->skip_bad_event_on_import = true;\n\
\$c->external_refresh = 60;" > /etc/davical/config.php

# Set timezone for container
ARG TIMEZONE

RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
echo $TIMEZONE > /etc/timezone && \
sed -i "s|date.timezone = UTC|date.timezone = $TIMEZONE|g" /etc/php5/php.ini && \
sed -i "s|max_execution_time = 30|max_execution_time = 120|g" /etc/php5/php.ini

# Add apache virtualhost conf
ADD ./davical.conf /etc/apache2/conf.d/davical.conf

# Set global servername
RUN echo "ServerName $domainname" >> /etc/apache2/httpd.conf

# Create dir for httpd to create a .pid
RUN mkdir /run/apache2

# Create startup script
RUN echo -e "ntpd -S\n\
httpd -DFOREGROUND" >> /usr/local/bin/startup.sh

# Set permissions
RUN chown -R root:apache /usr/share/ && \
chown root:apache /etc/davical/config.php && \
chmod 700 /usr/local/bin/startup.sh

# clean up unused packages after build
RUN apk del git

EXPOSE 80

CMD /usr/local/bin/startup.sh
