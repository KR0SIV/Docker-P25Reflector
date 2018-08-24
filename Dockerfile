#!/bin/bash

FROM ubuntu:latest
MAINTAINER Harold Giddings KR0SIV "harold@giddings.me"

WORKDIR /
ENV HOME /

RUN apt-get update
RUN apt-get install build-essential -y
RUN apt-get install libstdc++6 -y

COPY P25Reflector /P25Reflector
COPY P25Reflector.ini /etc/P25Reflector.ini
COPY DMRIds.dat /DMRIds.dat
COPY entry.sh /entry.sh

RUN chmod +x /P25Reflector
RUN chmod +x /entry.sh
RUN chmod +x /etc/P25Reflector.ini
RUN chmod +x /DMRIds.dat

EXPOSE 41000/udp
ENTRYPOINT ["/entry.sh"]
