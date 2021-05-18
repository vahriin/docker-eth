FROM ubuntu:16.04
LABEL version="0.1"
LABEL maintainer="i.podsevalov@spbu.ru"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes software-properties-common
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update && apt-get install --yes geth
RUN apt-get update && apt-get install --yes iputils-ping
RUN apt-get update && apt-get install --yes iproute2
RUN adduser --disabled-login --gecos "" eth_user

COPY distr /home/eth_user/distr
RUN chown -R eth_user:eth_user /home/eth_user/distr
RUN chmod +x /home/eth_user/distr/connect.sh
RUN chmod +x /home/eth_user/distr/check.sh

USER eth_user
WORKDIR /home/eth_user
RUN geth --nousb init distr/genesis.json
RUN rm -rf /home/eth_user/.ethereum/geth/nodekey