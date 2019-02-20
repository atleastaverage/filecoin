#!/bin/bash
cd $GOPATH/src/github.com/filecoin-project/go-filecoin
git fetch origin devnet-user -f
git checkout devnet-user
FILECOIN_USE_PRECOMPILED_RUST_PROOFS=true go run ./build/*.go deps
go run ./build/*.go build
go run ./build/*.go install
