#!/bin/bash

num=$1
geth --password distr/password account new
geth --identity="Node${num}" --mine --miner.threads=1 --verbosity 3 --networkid 98760 --rpc --rpcaddr 16.0.0.${num} --rpcport=800${num} --nousb --rpcapi="admin,eth,net,web3,personal" --allow-insecure-unlock console