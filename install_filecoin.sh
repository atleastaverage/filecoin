#!/bin/bash
# https://github.com/filecoin-project/go-filecoin

read -n 1 -s -r -p "This script will attempt to install filecoin. Press any key to continue."
printf "\n\n"

read -n 1 -s -r -p "sudo apt update && sudo apt dist-upgrade -y"
printf "\n"
sudo apt update && sudo apt dist-upgrade -y
printf "\n"

read -n 1 -s -r -p "sudo apt install -y git clang pkg-config curl jq screen"
printf "\n"
sudo apt install -y git clang pkg-config curl jq screen
printf "\n"

read -n 1 -s -r -p "echo \"export GOPATH=$HOME/go\" >> ~/.profile"
printf "\n"
echo "export GOPATH=$HOME/go" >> ~/.profile
printf "\n"

read -n 1 -s -r -p "source ~/.profile"
printf "\n"
source ~/.profile
printf "\n"

read -n 1 -s -r -p "rm -rf ${GOPATH}/src/github.com/filecoin-project"
printf "\n"
rm -rf ${GOPATH}/src/github.com/filecoin-project
printf "\n"

read -n 1 -s -r -p "mkdir -p ${GOPATH}/src/github.com/filecoin-project"
printf "\n"
mkdir -p ${GOPATH}/src/github.com/filecoin-project
printf "\n"

read -n 1 -s -r -p "git clone https://github.com/filecoin-project/go-filecoin.git ${GOPATH}/src/github.com/filecoin-project/go-filecoin"
printf "\n"
git clone https://github.com/filecoin-project/go-filecoin.git ${GOPATH}/src/github.com/filecoin-project/go-filecoin
printf "\n"

read -n 1 -s -r -p "cd ~"
printf "\n"
cd ~
printf "\n"

read -n 1 -s -r -p "rm go1* #This deletes old versions of go that you might have in this directory."
printf "\n"
rm go1*
printf "\n"

read -n 1 -s -r -p "wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz"
printf "\n"
wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
printf "\n"

read -n 1 -s -r -p "sudo tar -C /usr/local -xzf go1.11.5.linux-amd64.tar.gz"
printf "\n"
sudo tar -C /usr/local -xzf go1.11.5.linux-amd64.tar.gz
printf "\n"

read -n 1 -s -r -p "echo \"export PATH=$PATH:/usr/local/go/bin\" >> ~/.profile"
printf "\n"
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
printf "\n"

read -n 1 -s -r -p "source ~/.profile"
printf "\n"
source ~/.profile
printf "\n"

read -n 1 -s -r -p "curl https://sh.rustup.rs -sSf | sh -s -- -y"
printf "\n"
curl https://sh.rustup.rs -sSf | sh -s -- -y
printf "\n"

read -n 1 -s -r -p "source $HOME/.cargo/env"
printf "\n"
source $HOME/.cargo/env
printf "\n"

read -n 1 -s -r -p "Press any key to continue"
printf "\n"
echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.profile
printf "\n"

read -n 1 -s -r -p "source ~/.profile"
printf "\n"
source ~/.profile
printf "\n"

read -n 1 -s -r -p "cd ${GOPATH}/src/github.com/filecoin-project/go-filecoin"
printf "\n"
cd ${GOPATH}/src/github.com/filecoin-project/go-filecoin
printf "\n"

read -n 1 -s -r -p "FILECOIN_USE_PRECOMPILED_RUST_PROOFS=true go run ./build/*.go deps"
printf "\n"
FILECOIN_USE_PRECOMPILED_RUST_PROOFS=true go run ./build/*.go deps
printf "\n"

read -n 1 -s -r -p "go run ./build/*.go build"
printf "\n"
go run ./build/*.go build
printf "\n"

read -n 1 -s -r -p "go run ./build/*.go install"
printf "\n"
go run ./build/*.go install
printf "\n"

read -n 1 -s -r -p "#go run ./build/*.go test #Or don't bother :)"
printf "\n"
#go run ./build/*.go test #Or don't bother :)
printf "\n"

read -n 1 -s -r -p "https://github.com/filecoin-project/go-filecoin/wiki/Getting-Started"
printf "\n"
printf "\n"

read -n 1 -s -r -p "go-filecoin init --devnet-user --genesisfile=http://user.kittyhawk.wtf:8020/genesis.car"
printf "\n"
go-filecoin init --devnet-user --genesisfile=http://user.kittyhawk.wtf:8020/genesis.car
printf "\n"



read -n 1 -s -r -p "screen -S filecoin -dm 'go-filecoin daemon' #This will launch a filecoin daemon in the background and wait a minute for it to start."
printf "\n"
printf "\n"
printf "\n"
read -n 1 -s -r -p "This step appears to be broken. Check that the server is running, or pop into a new window and start it before you continue!"
printf "\n"
printf "\n"
printf "\n"
screen -S filecoin -dm 'go-filecoin daemon'
for i in {60..1..1};do echo -n "$i.." && sleep 1; done
printf "\n"

read -n 1 -s -r -p "go-filecoin swarm peers # lists addresses of peers to which you're connected"
printf "\n"
go-filecoin swarm peers 
printf "\n"

read -n 1 -s -r -p "go-filecoin config heartbeat.nickname \"Huber\" #This will configure your filecoin server to be called Huber. You can change that."
printf "\n"
go-filecoin config heartbeat.nickname "Huber"
printf "\n"

read -n 1 -s -r -p "go-filecoin config heartbeat.nickname #shows your current name"
printf "\n"
go-filecoin config heartbeat.nickname #shows your current name
printf "\n"

read -n 1 -s -r -p "go-filecoin config heartbeat.beatTarget \"/dns4/stats-infra.kittyhawk.wtf/tcp/8080/ipfs/QmUWmZnpZb6xFryNDeNU7KcJ1Af5oHy7fB9npU67sseEjR\" #Share data with network"
printf "\n"
go-filecoin config heartbeat.beatTarget "/dns4/stats-infra.kittyhawk.wtf/tcp/8080/ipfs/QmUWmZnpZb6xFryNDeNU7KcJ1Af5oHy7fB9npU67sseEjR" #Share data with network
printf "\n"

read -n 1 -s -r -p "/usr/bin/firefox --new-window https://stats.kittyhawk.wtf/ Open the stats page in firefox."
printf "\n"
/usr/bin/firefox --new-window https://stats.kittyhawk.wtf/ 
printf "\n"

read -n 1 -s -r -p "# https://github.com/filecoin-project/go-filecoin/wiki/Getting-Started#get-fil-from-the-filecoin-faucet"
printf "\n"
# https://github.com/filecoin-project/go-filecoin/wiki/Getting-Started#get-fil-from-the-filecoin-faucet
printf "\n"

read -n 1 -s -r -p "export WALLET_ADDR=`go-filecoin wallet addrs ls`    # fetch your wallet address into a handy variable"
printf "\n"
export WALLET_ADDR=`go-filecoin wallet addrs ls`    # fetch your wallet address into a handy variable
printf "\n"

read -n 1 -s -r -p "MESSAGE_CID=`curl -X POST -F \"target=${WALLET_ADDR}\" \"http://user.kittyhawk.wtf:9797/tap\" | cut -d\" \" -f4`"
printf "\n"
MESSAGE_CID=`curl -X POST -F "target=${WALLET_ADDR}" "http://user.kittyhawk.wtf:9797/tap" | cut -d" " -f4`
printf "\n"

read -n 1 -s -r -p "Press any key to continue"
printf "\n"
