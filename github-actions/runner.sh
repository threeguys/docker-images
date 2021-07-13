#!/bin/bash

function theTerminator() {
    /actions-runner/config.sh remove --token ${REPO_TOKEN}
}

trap 'echo "Got SIGTERM - Exiting..." && theTerminator' SIGTERM

cd /actions-runner
./config.sh --unattended --url ${REPO_URL} --token ${REPO_TOKEN} --name ${RUNNER_NAME}
./run.sh "$@" &
runner_pid=$!

wait ${runner_pid}
