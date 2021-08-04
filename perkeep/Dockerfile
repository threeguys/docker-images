FROM tgl/golang

COPY go/ /go/

RUN git clone https://github.com/perkeep/perkeep.git \
    && cd /perkeep \
    && git checkout tags/0.11 \
    && go run make.go -static

RUN go get github.com/threeguys/pk-keygen

FROM ubuntu:20.04

RUN apt update && apt install -y gettext jq

COPY --from=0 /root/go/bin/perkeepd /usr/local/bin/perkeepd
COPY --from=0 /root/go/bin/pk /usr/local/bin/pk
COPY --from=0 /root/go/bin/pk-deploy /usr/local/bin/pk-deploy
COPY --from=0 /root/go/bin/pk-get /usr/local/bin/pk-get
COPY --from=0 /root/go/bin/pk-mount /usr/local/bin/pk-mount
COPY --from=0 /root/go/bin/pk-put /usr/local/bin/pk-put

COPY --from=0 /root/go/bin/pk-keygen /usr/local/bin/pk-keygen

RUN mkdir -p \
    /var/local/perkeep/.config/perkeep \
    /var/local/perkeep/blobs \
    /var/local/perkeep/index

ARG PERKEEP_AUTH
ARG PERKEEP_IDENTITY

ENV PERKEEP_SECRING=/var/local/perkeep/keys/secring.gpg
ENV PERKEEP_BLOBPATH=/var/local/perkeep/blobs
ENV PERKEEP_LEVELDB=/var/local/perkeep/index/level.db

COPY server-config.json.template /var/local/perkeep/server-config.json.template

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 3179

WORKDIR /var/local/perkeep

ENTRYPOINT [ "/entrypoint.sh" ]
