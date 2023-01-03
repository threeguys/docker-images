FROM ubuntu:18.04

RUN apt update && apt install -y python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install calibreweb

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

RUN mkdir -p /library /web

ENV CALIBRE_LIBRARY_DBPATH="/library/Calibre Library/metadata.db"
ENV CALIBRE_DBPATH=/data/web.db
ENV CALIBRE_PORT=8083

EXPOSE 8083

ENTRYPOINT [ "/entrypoint.sh" ]
