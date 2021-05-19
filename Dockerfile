FROM ubuntu:16.04
LABEL version="0.1.1"
LABEL maintainer="i.podsevalov@spbu.ru"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes software-properties-common
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update && apt-get install --yes geth iputils-ping iproute2
RUN adduser --disabled-login --gecos "" eth_user

COPY --chown=eth_user:eth_user distr /home/eth_user/distr
USER eth_user
WORKDIR /home/eth_user
RUN chmod +x /home/eth_user/distr/connect.sh /home/eth_user/distr/check.sh
RUN geth --nousb init distr/genesis.json && \
    rm -rf /home/eth_user/.ethereum/geth/nodekey