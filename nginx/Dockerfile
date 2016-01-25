FROM vsense/baseimage:alpine

MAINTAINER vSense <docker@vsense.fr>

RUN adduser -D -u 5001 -s /sbin/nologin -h /var/www nginx

RUN apk add --update \
    nginx \
    && mkdir -p /tmp/nginx/client-body \
                /etc/nginx/sites-enabled \
    && chown -R nginx:nginx /var/lib/nginx \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx"]
