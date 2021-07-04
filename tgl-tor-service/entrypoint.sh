#!/bin/bash

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        DOLLAR="$" envsubst < /home/tor/torrc.template > /usr/local/etc/tor/torrc
        set -- nginx -g "daemon off;" "$@"
    ;;
esac

exec "$@"
