#!/bin/bash

OUTPUT=${OUTPUT:-/site}

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        set -- /usr/local/bin/eleventy --output=${OUTPUT} "$@"
    ;;
esac

exec "$@"
