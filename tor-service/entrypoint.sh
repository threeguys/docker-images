#!/bin/bash

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        DOLLAR="$" envsubst < /home/tor/torrc.template > /usr/local/etc/tor/torrc
        cat /usr/local/etc/tor/torrc
        set -- /usr/local/bin/tor "$@"
    ;;
esac

exec "$@"
