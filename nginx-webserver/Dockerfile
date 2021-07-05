FROM ubuntu:18.04

RUN apt update && apt install -y nginx nginx-extras gettext

COPY site.conf /etc/nginx/sites-available/default.template
COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

#CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]

ENTRYPOINT [ "/entrypoint.sh" ]
