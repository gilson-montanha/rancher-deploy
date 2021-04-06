FROM alpine:latest

ARG INPUT_URI
ARG INPUT_TOKEN
ARG INPUT_CONTEXT
ARG INPUT_COMMAND

RUN apk add curl bash

RUN curl -L https://github.com/rancher/cli/releases/download/v2.4.10/rancher-linux-amd64-v2.4.10.tar.xz > rancher.tar.xz \
  && tar -C /tmp -xJf rancher.tar.xz \
  && mv /tmp/rancher-v2.4.10/rancher /bin/rancher \
  && chmod +x /bin/rancher

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
