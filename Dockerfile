FROM alpine:3.1

MAINTAINER vSense <docker@vsense.fr>

RUN adduser -D -u 5001 -s /sbin/nologin -h /var/www nginx

RUN apk add --update \
    nginx \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /tmp/nginx/client-body \
                /etc/nginx/sites-enabled

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME /var/www

EXPOSE 80 443

CMD ["nginx"]
