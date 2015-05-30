# docker-nginx

Container Docker Nginx with consul-template integration running on Alpine Linux

This image is aimed to be use as a reverse web proxy. The integation with
consul-template allows to use consul backend. With consul-template, one can
dynamically forward web requests towards the host running the desired web
service.

If the host running the web service is down, consul-template will update nginx
with new informations about web service's new host.

/etc/supervisor-consul directory contains supervisor processes definition for
each vhost on your nginx reverse proxy.
These supervisor processes definition look like :
```
[program:blog]
command:/usr/bin/consul-template -consul IP-CONSOL:8500 -template "/etc/nginx/template/blog.template:/etc/nginx/sites-enabled/blog:supervisorctl restart nginx"
autostart=true
autorestart=true
```
The `template` parameter takes 3 arguments with : as a separator, the first one is the path to the template, the seconde one to the file generated and the last one is the command executed
