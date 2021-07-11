FROM node:16-slim

RUN mkdir -p /src /site && npm install @11ty/eleventy --global --cli

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

WORKDIR /src

ENTRYPOINT [ "/entrypoint.sh" ]
