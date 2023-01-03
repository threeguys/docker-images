#!/bin/bash

LLVM_VERSION=10.0.0
LLVM_DISTRO="x86_64-linux-sles11.3"
LLVM_SHA256SUM="a7a3c2a7aff813bb10932636a6f1612e308256a5e6b5a5655068d5c5b7f80e86"

source /tools/build_container_common.sh

yum clean all -y
