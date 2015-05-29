FROM alpine:3.1

MAINTAINER vSense <docker@vsense.fr>

ENV PKGVER 0.9.0

RUN adduser -D -u 5001 -s /sbin/nologin -h /var/www nginx

RUN apk --update add \
    nginx \
    supervisor \
    && apk --update add --virtual deps \
    wget \
    tar \
    && wget --no-check-certificate https://github.com/hashicorp/consul-template/releases/download/v"$PKGVER"/consul-template_"$PKGVER"_linux_amd64.tar.gz -O - | tar xz --strip-components 1 -C /usr/bin \
    && apk del deps \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /tmp/nginx/client-body \
                /etc/nginx/sites-enabled

COPY supervisord-nginx-consul.ini /etc/supervisor.d/supervisord-nginx-consul.ini
COPY supervisord.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf

VOLUME /var/www

EXPOSE 80 443

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
