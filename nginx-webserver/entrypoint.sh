#!/bin/bash

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        DOLLAR="$" envsubst < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default
        set -- nginx -g "daemon off;" "$@"
    ;;
esac

exec "$@"
