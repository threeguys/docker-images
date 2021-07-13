#!/bin/bash

export PATH=/actions-runner:${PATH}

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        set -- /runner.sh "$@"
    ;;
esac

exec "$@"
