FROM ubuntu:18.04

RUN apt update && apt install -y gcc make libssl-dev libevent-dev zlib1g-dev wget

ENV TOR_VERSION=0.4.6.6

WORKDIR /usr/local/app/

RUN wget https://dist.torproject.org/tor-${TOR_VERSION}.tar.gz

RUN cd /usr/local/app/ \
    && tar -xzf /usr/local/app/tor-${TOR_VERSION}.tar.gz

RUN cd /usr/local/app/tor-${TOR_VERSION} \
     && ./configure && make -j4

FROM ubuntu:18.04

RUN apt update && apt install -y openssl libevent-2.1-6 zlib1g \
    && mkdir -p /usr/local/etc/tor \
    && mkdir -p /usr/local/share/tor \
    && mkdir -p /usr/local/bin \
    && mkdir -p /home/tor && chown 1000 /home/tor

ENV TOR_VERSION=0.4.6.6

ENV SRC_DIR=/usr/local/app/tor-${TOR_VERSION}/src
ENV APP_DIR=${SRC_DIR}/app
ENV TOOL_DIR=${SRC_DIR}/tools
ENV CONF_DIR=${SRC_DIR}/config

ENV SERVICE_NAME=localhost
ENV SERVICE_PORT=8080

COPY --from=0 ${APP_DIR}/tor ${TOOL_DIR}/tor-resolve ${TOOL_DIR}/tor-print-ed-signing-cert ${TOOL_DIR}/tor-gencert /usr/local/bin/
COPY --from=0 ${CONF_DIR}/torrc.sample /usr/local/etc/tor/torrc.sample
COPY --from=0 ${CONF_DIR}/geoip6 ${CONF_DIR}/geoip /usr/local/share/tor/

COPY torrc.template /home/tor/torrc.template
COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
