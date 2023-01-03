FROM amazonlinux:2

# Set system locale
ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"

# Install build tool prerequisites
RUN yum update -y \
    && yum install -y gcc gcc-c++ java-1.8.0-openjdk-headless jq rsync \
        git wget libstdc++ autoconf automake cmake3 libtool make ninja-build \
        patch python3-pip unzip xz ncurses-devel which nano \
    && yum clean all

# Fake out libncurses and alias ninja/cmake
RUN ln -s /usr/lib64/libncursesw.so.6.0 /usr/lib64/libncurses.so.5 \
    && alternatives --install /usr/local/bin/ninja ninja /usr/bin/ninja-build 10 \
    && alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake3 10

# Download the container build script from the envoy-build-tools repo
RUN mkdir /tools \
    && curl -o /tools/build_container_common.sh \
        https://raw.githubusercontent.com/envoyproxy/envoy-build-tools/b19d74904f19043eb196b73357853d5bce35622c/build_container/build_container_common.sh \
    && echo "4aebece613ff0f9a93780321c87ab5dc477f1a74486618110c1cca0045721f35  /tools/build_container_common.sh" | sha256sum -c -

COPY build_container_amzlnx.sh /tools/build_container_amzlnx.sh
RUN chmod 755 /tools/build_container_amzlnx.sh

# Setup the build tools
RUN /tools/build_container_amzlnx.sh
