FROM vsense/baseimage:alpine

MAINTAINER vSense <docker@vsense.fr>

RUN adduser -D -u 5001 -s /sbin/nologin -h /var/www nginx

RUN apk add --update \
    nginx \
    php-fpm \
    supervisor \
    && mkdir -p /tmp/nginx/client-body \
                /etc/nginx/sites-enabled \
    && sed -i \
    -e 's/group =.*/group = nginx/' \
    -e 's/user =.*/user = nginx/' \
    -e 's/listen\.owner.*/listen\.owner = nginx/' \
    -e 's/listen\.group.*/listen\.group = nginx/' \
    -e 's/error_log =.*/error_log = \/dev\/stdout/' \
    /etc/php/php-fpm.conf \
    && sed -i \
    -e '/open_basedir =/s/^/\;/' \
    /etc/php/php.ini \
    && chown -R nginx:nginx /var/lib/nginx \
    && rm -rf /var/cache/apk/*

COPY supervisord-php-fpm.ini /etc/supervisor.d/supervisord-php-fpm.ini

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
