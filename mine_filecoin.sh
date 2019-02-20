#!/bin/bash
#go-filecoin wallet addrs ls

#Take the address to the faucet and request FIL: http://user.kittyhawk.wtf:9797/tap

#go-filecoin wallet balance `go-filecoin wallet addrs ls`

#go-filecoin message wait zDPWYqFCvKeoHpBZqn5jCxf9DKW2Lk6U14LEoM8q35onS4A8Kmcz #wait for the tx to #go through
#go-filecoin mining

\# https://github.com/filecoin-project/go-filecoin/wiki/Mining-Filecoin

    First number is the number of sectors (one sector = 256Mb), the second number is the amount of FIL you're using as collateral

go-filecoin miner create 800 800 --price=0 --limit=1000 --peerid `go-filecoin id | jq -r '.ID'` # this may take a minute

go-filecoin mining start
Create an ask

export MINER_ADDR=`go-filecoin config mining.minerAddress | tr -d \"`

export MINER_OWNER_ADDR=`go-filecoin miner owner $MINER_ADDR`

go-filecoin miner set-price --from=$MINER_OWNER_ADDR --miner=$MINER_ADDR --price=0 --limit=1000 0.000000001 2880 # output: CID of the ask

go-filecoin client list-asks --enc=json | jq 
