#!/bin/bash
# https://pkg.cloudflareclient.com/
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt-get update && sudo apt-get -y install cloudflare-warp

# https://developers.cloudflare.com/warp-client/get-started/linux/
echo '#' warp-cli --accept-tos registration new
warp-cli --accept-tos registration new
