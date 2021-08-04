FROM ubuntu:20.04

ENV BUILDARCH=amd64

COPY go.${BUILDARCH}.sha256 /go.sha256

RUN apt update && apt install wget git -y \
    && wget -q https://golang.org/dl/go1.16.6.linux-${BUILDARCH}.tar.gz \
    && sha256sum -c go.sha256 \
    && tar -xzf go1.16.6.linux-${BUILDARCH}.tar.gz \
    && rm go1.16.6.linux-${BUILDARCH}.tar.gz \
    && rm -rf /var/lib/apt/lists/*

ENV PATH=${PATH}:/go/bin
