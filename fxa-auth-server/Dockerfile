FROM ubuntu:18.04

RUN apt update \
    && apt install -y curl git \
    && apt purge

RUN curl -fsSL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

RUN git clone git://github.com/mozilla/fxa-auth-server.git \
    && cd fxa-auth-server \
    && npm install

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
