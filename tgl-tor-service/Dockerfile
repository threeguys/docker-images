FROM ubuntu:18.04

RUN apt update && apt install -y gcc make libssl-dev libevent-dev zlib1g-dev

ENV TOR_VERSION=0.4.6.6

COPY tor-${TOR_VERSION}.tar.gz /usr/local/app/tor-${TOR_VERSION}.tar.gz

WORKDIR /usr/local/app/

RUN cd /usr/local/app/ \
    && tar -xzf /usr/local/app/tor-${TOR_VERSION}.tar.gz

RUN cd /usr/local/app/tor-${TOR_VERSION} \
     && ./configure && make -j4 && make install

FROM ubuntu:18.04

RUN apt update && apt install -y openssl libevent-2.1-6 zlib1g \
    && mkdir -p /usr/local/etc/tor \
    && mkdir -p /usr/local/share/tor \
    && mkdir -p /usr/local/bin \
    && mkdir -p /home/tor && chown 1000 /home/tor

ENV TOR_VERSION=0.4.6.6
ENV SRC_DIR=/usr/local/app/tor-${TOR_VERSION}/src
ENV SERVICE_NAME=localhost

COPY --from=0 ${SRC_DIR}/app/tor /usr/local/bin/tor
COPY --from=0 ${SRC_DIR}/config/torrc.sample /usr/local/etc/tor/torrc.sample
COPY --from=0 ${SRC_DIR}/config/geoip6 /usr/local/share/tor/geoip6
COPY --from=0 ${SRC_DIR}/config/geoip /usr/local/share/tor/geoip
COPY etc/torrc /usr/local/etc/tor/torrc

CMD [ "/usr/local/bin/tor" ]
