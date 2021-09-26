FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
    apt-get upgrade -y && \
    apt-get install -y vim gnupg software-properties-common curl && \
    apt-get clean
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get install -y terraform && \
    terraform -install-autocomplete

WORKDIR /home