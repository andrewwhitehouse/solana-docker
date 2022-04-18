# solana-helloworld

## Build

`docker build -t solana-helloworld:0.0.1 .`

## Run

`docker images`

`docker run <image id>`

## Run example

### Get container id

`docker ps`

### Connect to container

`docker exec -it <container id> /bin/bash`

### Build

`cd cd example-helloworld`

`npm install`

`npm run build:program-rust`

### Deploy the smart contract

`solana program deploy dist/program/helloworld.so`

### Interact with the smart contract

`npm run start`

Copyright (c) 2022 Andrew Whitehouse. All rights reserved.
