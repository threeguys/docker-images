#!/bin/bash

if [ -z "${PERKEEP_IDENTITY}" ]; then
  if [ -f "${PERKEEP_SECRING}" ]; then
    if [ -f "${PERKEEP_SECRING}.json" ]; then
        export PERKEEP_IDENTITY=`jq -r ".identity" ${PERKEEP_SECRING}.json`
    else
        echo "Key exists but no PERKEEP_IDENTITY set and cannot infer from JSON"
        exit -1
    fi
  else
      pk-keygen -secret ${PERKEEP_SECRING} -config ${PERKEEP_SECRING}.json
      export PERKEEP_IDENTITY=`jq -r ".identity" ${PERKEEP_SECRING}.json`
  fi
fi

if [ -z "${PERKEEP_AUTH}" ]; then
  export PERKEEP_AUTH="localhost"
fi

DOLLAR="$" envsubst < /var/local/perkeep/server-config.json.template > /var/local/perkeep/server-config.json

echo "Identity is ${PERKEEP_IDENTITY}"

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        set -- /usr/local/bin/perkeepd -configfile /var/local/perkeep/server-config.json "$@"
    ;;
esac

exec "$@"
