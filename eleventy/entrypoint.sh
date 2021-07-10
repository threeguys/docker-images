#!/bin/bash

INPUT=${INPUT:-/src}
OUTPUT=${OUTPUT:-/site}

export PATH=/root/node_modules/bin:${PATH}
export NPM_CONFIG_PREFIX=/root/node_modules

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        set -- /root/node_modules/bin/eleventy --input=${INPUT} --output=${OUTPUT} "$@"
    ;;
esac

exec "$@"
