FROM ubuntu:focal
MAINTAINER Andrew Whitehouse <you@example.com>

WORKDIR /home

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/solana-labs/example-helloworld.git

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get install -y curl gcc

RUN curl -sL https://deb.nodesource.com/setup_14.x -o /tmp/nodesource_setup.sh

RUN bash /tmp/nodesource_setup.sh

RUN apt-get install -y nodejs

RUN npm install ts-node

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# RUN cd example-helloworld && npm install && npm run build:program-rust

RUN sh -c "$(curl -sSfL https://release.solana.com/v1.10.8/install)"

ENV PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

RUN solana --version

COPY id.json /root/.config/solana/

RUN chmod 600 /root/.config/solana/

RUN solana config set --url localhost

EXPOSE 8899 

CMD ["solana-test-validator"]
