FROM ubuntu:14.04

### solve some problems with shell commands ###
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get -y install \
            build-essential \
            software-properties-common \
            openssh-server \
            nginx \
            supervisor \
            wget

COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-available/default
COPY nginx_supervisord.conf /etc/supervisor/conf.d/nginx_supervisord.conf