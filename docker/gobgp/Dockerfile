FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/osrg/gobgp/releases/download/v1.25/gobgp_1.25_linux_amd64.tar.gz && \ 
    tar zxvf gobgp_1.25_linux_amd64.tar.gz && \
    mv gobgp* /usr/bin/

RUN mkdir -p /opt/gobgp
WORKDIR /opt/gobgp/

COPY docker/gobgp/configs/* ./configs/

EXPOSE 50051
ENTRYPOINT ["gobgpd"]
