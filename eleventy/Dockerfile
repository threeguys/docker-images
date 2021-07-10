FROM node:16-slim

RUN mkdir -p /src /site \
    && npm install @11ty/eleventy --global --cli --prefix /root/node_modules

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
