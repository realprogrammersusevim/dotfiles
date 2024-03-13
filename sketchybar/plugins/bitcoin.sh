#!/usr/bin/env bash

source .env
PERCENTAGE="$(curl -s --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "getblockchaininfo", "params": []}' -H 'content-type: text/plain;' http://$BITCOIN_USER:$BITCOIN_PASSWORD@127.0.0.1:8332 | jq .result.verificationprogress | xargs -I {} echo "scale=2; {}*100" | bc | xargs printf "%.3f\n")"

sketchybar --set $NAME label="${PERCENTAGE}%"
