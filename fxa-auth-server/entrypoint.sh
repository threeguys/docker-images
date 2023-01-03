#!/bin/bash

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        set -- "$@"
    ;;
esac

exec "$@"
