FROM ubuntu:latest

WORKDIR /tmp

ADD . .

RUN bash setup
