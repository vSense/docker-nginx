FROM alpine:3.1

MAINTAINER vSense <docker@vsense.fr>

#RUN adduser -D -u 5001 -s /sbin/nologin -h /var/www nginx

RUN apk add --update \
    nginx \
    ansible \
    curl \
    && rm -rf /var/cache/apk/* \
    && curl -L https://raw.githubusercontent.com/vSense/docker-nginx/master/ansible/playbook.yml -o playbook.yml \
    && ansible-playbook -i "localhost," -c local playbook.yml

VOLUME /var/www

EXPOSE 80 443

CMD ["nginx"]
