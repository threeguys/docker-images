FROM amzlnx-builder

ENV ENVOY_URL=https://github.com/envoyproxy/envoy.git
ENV ENVOY_BRANCH=tags/v1.17.0
ENV SOURCE_DIR=/source
ENV BUILD_DIR=/build

ENV ENVOY_STDLIB=libstdc++
ENV ENVOY_DOCKER_BUILD_DIR=${BUILD_DIR}
ENV ENVOY_BUILD_ARCH=x86_64
ENV ENVOY_SRCDIR=${SOURCE_DIR}
ENV BUILD_SOURCEBRANCHNAME=tags/v1.17.0
ENV BAZEL_BUILD_OPTIONS="--define boringssl=fips"

RUN mkdir -p ${SOURCE_DIR} ${BUILD_DIR} \
    && git clone ${ENVOY_URL} ${SOURCE_DIR} \
    && cd ${SOURCE_DIR} \
    && git checkout ${BUILD_SOURCEBRANCHNAME}

WORKDIR ${SOURCE_DIR}

RUN ci/do_ci.sh bazel.release.server_only

FROM amazonlinux:2

COPY --from=0 ${BUILD_DIR}/envoy/source/exe/envoy /usr/local/bin/envoy

ENTRYPOINT [ "/bin/bash" ]
