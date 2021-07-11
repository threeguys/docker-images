#!/bin/bash

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        DOLLAR="$" envsubst < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default
        cat /etc/nginx/sites-available/default
        echo "Bootstrapping nginx..."
        set -- nginx -g "daemon off;" "$@"
    ;;
esac

exec "$@"
