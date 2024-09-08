# warp-action

[![Test](https://github.com/nekorobi/warp-action/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/nekorobi/warp-action/actions)

- Install [Cloudflare WARP Client](https://developers.cloudflare.com/warp-client/get-started/linux/), connect WARP
- This VPN allows GitHub action to use IPv6 network

## Usage
### `your-repository/.github/workflows/example.yml`

```yaml
name: Example Workflow
on:
  workflow_dispatch:
  push:
    branches: [main]
jobs:
  ipv6-ping:
    runs-on: ubuntu-latest
    steps:
      - name: Install, connect WARP
        uses: nekorobi/warp-action@v1
      - name: IPv6 ping
        run: ping -6 -c 3 -W 1 dns.google.com
```

## MIT License
- © 2024 Nekorobi
