#!/bin/bash

LIBRARY_DBPATH=${CALIBRE_LIBRARY_DBPATH:-/library}
CALIBRE_DBPATH=${CALIBRE_DBPATH:-/data/web.db}
CALIBRE_PORT=${CALIBRE_PORT:-8083}

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        # set -- /usr/bin/python3 -m cps -p ${LIBRARY_DBPATH} "$@"
        set -- /usr/bin/python3 -c "import calibreweb; calibreweb.main()" -p "${LIBRARY_DBPATH}" "$@"
    ;;
esac

exec "$@"
