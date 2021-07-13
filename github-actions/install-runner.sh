#!/bin/bash

RUNNER_DIR=${1}
PLATFORM_NAME="${2:-linux}"
PLATFORM_TYPE="${3:-x64}"

GITHUB_RELEASES_URL="https://api.github.com/repos/actions/runner/releases/latest"

# Get the matching element for our platform
latest=$(curl -s -X GET "${GITHUB_RELEASES_URL}" \
    | jq -r ".assets[] | select(.name | startswith(\"actions-runner-${PLATFORM_NAME}-${PLATFORM_TYPE}\"))")

name=$(echo "${latest}" | jq -r '.name')
download_url=$(echo "${latest}" | jq -r '.browser_download_url')
updated_at=$(echo "${latest}" | jq -r '.updated_at')

echo ${latest} | json_pp
echo
echo "Downloading ${name}"
echo "Updated: ${updated_at}"
echo "URL: ${download_url}"

pushd ${RUNNER_DIR}
# Download and extract
curl -o ${name} -L ${download_url} \
    && tar -xzf ${name} \
    && rm ${name}

. ./bin/installdependencies.sh
popd

echo "Installation complete!"
