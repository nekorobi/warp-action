#!/bin/bash
set -e
echo '#' warp-cli --accept-tos status
warp-cli --accept-tos status
sleep 3 # wait

url=https://www.cloudflare.com/cdn-cgi/trace/
args="--connect-timeout 3 --max-time 3 --retry 3 --fail --no-progress-meter $url"
echo '#' curl -4 $args
curl4=$(curl -4 $args)
echo "$curl4"

echo '#' curl -6 $args
curl6=$(curl -6 $args)
echo "$curl6"

echo "$curl4" | grep '^warp=on$' >/dev/null || exit 4
echo "$curl6" | grep '^warp=on$' >/dev/null || exit 6
