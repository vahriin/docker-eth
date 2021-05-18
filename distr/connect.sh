#!/bin/bash

END=$1

for i in $(seq 3 $END) 
do	
	ip=16.0.0.${i}
	port=800${i}
	enode="$(geth --exec admin.nodeInfo.enode attach http://${ip}:${port})"
	echo $enode

	peer="${enode/127.0.0.1/$ip}"
	echo $peer
	geth --exec "admin.addPeer(${peer})" attach http://16.0.0.2:8002
done