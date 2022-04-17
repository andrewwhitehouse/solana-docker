FROM ubuntu:jammy
MAINTAINER Andrew Whitehouse <you@example.com>

WORKDIR /home

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/solana-labs/example-helloworld.git

RUN apt-get -y install nodejs npm curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN sh -c "$(curl -sSfL https://release.solana.com/v1.10.8/install)"
