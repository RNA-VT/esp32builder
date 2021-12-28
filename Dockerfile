FROM ubuntu:latest

WORKDIR /tmp

ADD . .

RUN bash arduino-setup
RUN bash python-setup
RUN bash esp32-core-setup