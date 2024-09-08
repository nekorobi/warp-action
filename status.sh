#!/bin/bash
echo '#' warp-cli --accept-tos status
warp-cli --accept-tos status

args="--fail --silent https://www.cloudflare.com/cdn-cgi/trace/"
echo '#' curl -4 $args
curl4=$(curl -4 $args) || exit 4
echo "$curl4"

echo '#' curl -6 $args
curl6=$(curl -6 $args) || exit 6
echo "$curl6"

echo "$curl4" | grep '^warp=on$' >/dev/null || exit 4
echo "$curl6" | grep '^warp=on$' >/dev/null || exit 6
