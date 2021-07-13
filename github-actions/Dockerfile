FROM ubuntu:18.04

RUN apt update && apt install -y curl jq \
    && apt-get purge

RUN addgroup runners
RUN adduser --disabled-password --gecos "" --force-badname --ingroup runners runner

RUN mkdir -p /actions-runner \
    && chown runner /actions-runner \
    && chgrp runners /actions-runner \
    && chmod g+s /actions-runner

COPY install-runner.sh /install-runner.sh

RUN chmod 755 /install-runner.sh \
    && /install-runner.sh /actions-runner \
    && apt-get purge \
    && rm /install-runner.sh

ARG REPO_URL
ARG REPO_TOKEN
ARG RUNNER_NAME

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

COPY runner.sh /runner.sh
RUN chmod 755 /runner.sh

WORKDIR /actions-runner
USER runner

ENTRYPOINT [ "/entrypoint.sh" ]
