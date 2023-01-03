FROM ubuntu:20.04

RUN apt update && apt install -y python3 python3-pip pkg-config qt5-qmake less \
    libpodofo-dev libhunspell-dev libhyphen-dev libicu-dev \
    libsqlite3-dev libstemmer-dev libfreetype-dev libusb-1.0-0-dev libmtp-dev \
    



#RUN git clone https://github.com/kovidgoyal/calibre.git /calibre \
#    && cd /calibre \
#    && git checkout tags/v5.23.0

COPY calibre/ /calibre/

ENTRYPOINT [ "/bin/bash" ]
