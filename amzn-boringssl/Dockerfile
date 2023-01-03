FROM amazonlinux:2

# Set system locale
ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"

# Install build tool prerequisites
RUN yum update -y \
    && yum install -y git gcc gcc-c++ wget cmake3 libtool make ninja-build libunwind-devel \
        which nano \
    && yum clean all

# Alias ninja/cmake
RUN alternatives --install /usr/local/bin/ninja ninja /usr/bin/ninja-build 10 \
    && alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake3 10

RUN wget --no-verbose https://golang.org/dl/go1.16.6.linux-amd64.tar.gz \
    && echo "be333ef18b3016e9d7cb7b1ff1fdb0cac800ca0be4cf2290fe613b3d069dfe0d /go1.16.6.linux-amd64.tar.gz" | sha256sum -c - \
    && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.6.linux-amd64.tar.gz \
    && rm -f go1.16.6.linux-amd64.tar.gz

ENV PATH=${PATH}:/usr/local/go/bin

RUN git clone https://boringssl.googlesource.com/boringssl \
    && cd /boringssl && git checkout tags/fips-20210429 \
    && mkdir -p /boringssl/build && cd /boringssl/build \
    && cmake -GNinja .. \
    && ninja \
    && ninja run_tests
