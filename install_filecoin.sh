#!/bin/bash
# https://github.com/filecoin-project/go-filecoin

sudo apt update && sudo apt dist-upgrade -y

sudo apt install -y git clang pkg-config curl jq

echo "export GOPATH=$HOME/go" >> ~/.profile

source ~/.profile

mkdir -p ${GOPATH}/src/github.com/filecoin-project

git clone https://github.com/filecoin-project/go-filecoin.git ${GOPATH}/src/github.com/filecoin-project/go-filecoin

cd ~

wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go1.11.5.linux-amd64.tar.gz

echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile

source ~/.profile

curl https://sh.rustup.rs -sSf | sh -s -- -y

source $HOME/.cargo/env

echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.profile

source ~/.profile

cd ${GOPATH}/src/github.com/filecoin-project/go-filecoin

FILECOIN_USE_PRECOMPILED_RUST_PROOFS=true go run ./build/*.go deps

go run ./build/*.go build

go run ./build/*.go install

#go run ./build/*.go test #Or don't bother :)

go-filecoin daemon launch

# https://github.com/filecoin-project/go-filecoin/wiki/Getting-Started

go-filecoin init --devnet-user --genesisfile=http://user.kittyhawk.wtf:8020/genesis.car

go-filecoin daemon

go-filecoin swarm peers # lists addresses of peers to which you're connected

go-filecoin config heartbeat.nickname "Huber" #In quotes to select a name

go-filecoin config heartbeat.nickname #shows your current name

go-filecoin config heartbeat.beatTarget "/dns4/stats-infra.kittyhawk.wtf/tcp/8080/ipfs/QmUWmZnpZb6xFryNDeNU7KcJ1Af5oHy7fB9npU67sseEjR" #Share data with network

/usr/bin/firefox --new-window https://stats.kittyhawk.wtf/ 

# https://github.com/filecoin-project/go-filecoin/wiki/Getting-Started#get-fil-from-the-filecoin-faucet

export WALLET_ADDR=`go-filecoin wallet addrs ls`    # fetch your wallet address into a handy variable
MESSAGE_CID=`curl -X POST -F "target=${WALLET_ADDR}" "http://user.kittyhawk.wtf:9797/tap" | cut -d" " -f4`
