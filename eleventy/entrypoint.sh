#!/bin/bash

INPUT=${INPUT:-/src}
OUTPUT=${OUTPUT:-/site}

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        set -- /usr/local/bin/eleventy --input=${INPUT} --output=${OUTPUT} "$@"
    ;;
esac

exec "$@"
