FROM ubuntu:16.04

RUN echo '2018-01-13' && \
    apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install build-essential unzip alien && \
    rm -rf /var/lib/apt/lists/* /var/cache/*
