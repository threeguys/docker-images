FROM ubuntu:18.04

RUN apt update \
    && apt install -y nginx nginx-extras gettext \
    && rm -rf /var/lib/apt/lists/*

ENV SERVER_NAME=tgl-web-server

COPY site.conf /etc/nginx/sites-available/default.template

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
