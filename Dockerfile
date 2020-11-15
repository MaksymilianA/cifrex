FROM alpine:3.12
MAINTAINER cifrexBandit "admin@cert.cx"
LABEL version 6.0

RUN apk --update add \
    lighttpd \
    lighttpd-mod_auth \
    php7 \
    php7-iconv \
    php7-session \
    php7-json \
    php7-curl \
    php7-xml \
    php7-imap \
    php7-cgi \
    php7-fpm \
    php7-pdo \
    php7-mysqli \
    php7-mcrypt \
    php7-gettext \
    php7-ldap \
    php7-ctype \
    php7-openssl \
    php7-mbstring \
    mariadb-client \
    fcgi \
    postfix \
    dovecot \
    clamav \
    gross && rm -rf /var/cache/apk/*

ADD /config/lighttpd/lighttpd.conf /etc/lighttpd/lighttpd.conf
ADD /config/lighttpd/htpasswd.sh /etc/lighttpd/htpasswd.sh
ADD /config/lighttpd/createcredentails.sh /etc/lighttpd/createcredentails.sh
ADD /config/lighttpd/key.pem /etc/lighttpd/key.pem
ADD /config/php/php.ini /etc/php7/php.ini
ADD /src/ /var/www/web/
ADD /code/ /code/

RUN sh /etc/lighttpd/createcredentails.sh

RUN mkdir -p /var/www/web/ && \
    echo "<?php phpinfo();" > /var/www/web/info.php && \
    adduser www-data -G www-data -H -s /bin/false -D && \
    mkdir -p /run/lighttpd/ && \
    chown www-data. /run/lighttpd/

EXPOSE 80
EXPOSE 443

RUN chown -R www-data. /var/www/web/
RUN chown -R www-data. /var/log/lighttpd/
RUN chown -R www-data. /code/

RUN postfix start 2>/dev/null
#RUN chmod -R 777 /var/www/web/phpmyadmin
CMD php-fpm7 -D && lighttpd -D -f /etc/lighttpd/lighttpd.conf
