#!/bin/bash

if [ -z "${PERKEEP_IDENTITY}" ]; then
  if [ -f "${PERKEEP_SECRING}" ]; then
    if [ ! -f "${PERKEEP_SECRING}.json" ]; then
        echo "Key exists but no PERKEEP_IDENTITY set and cannot infer from JSON"
        exit -1
    fi
  else
    pk-keygen -secret ${PERKEEP_SECRING} -config ${PERKEEP_SECRING}.json
  fi
  export PERKEEP_IDENTITY=`jq -r ".identity" ${PERKEEP_SECRING}.json`
fi


if [ ! -f "${PERKEEP_CONFIG}" ] && [ -f "${PERKEEP_CONFIG}.template" ]; then
  echo "Creating server config ${PERKEEP_CONFIG} from template"
  DOLLAR="$" envsubst < ${PERKEEP_CONFIG}.template > ${PERKEEP_CONFIG}
fi

if [ ! -f "${PERKEEP_CLIENT_CONFIG}" ] && [ -f "${PERKEEP_CLIENT_CONFIG}.template" ]; then
  echo "Creating client config ${PERKEEP_CLIENT_CONFIG} from template"
  DOLLAR="$" envsubst < ${PERKEEP_CLIENT_CONFIG}.template > ${PERKEEP_CLIENT_CONFIG}
fi

echo "PERKEEP_CONFIG = ${PERKEEP_CONFIG}"
echo "PERKEEP_IDENTITY = ${PERKEEP_IDENTITY}"
echo "PERKEEP_SECRING = ${PERKEEP_SECRING}"
echo "PERKEEP_BLOBPATH = ${PERKEEP_BLOBPATH}"
echo "PERKEEP_LEVELDB = ${PERKEEP_LEVELDB}"

case "$1" in
    sh|bash|/bin/bash|/bin/sh)
        set -- "$@"
    ;;
    *)
        set -- /usr/local/bin/perkeepd -configfile ${PERKEEP_CONFIG} "$@"
    ;;
esac

exec "$@"
