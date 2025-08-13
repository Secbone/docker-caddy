# Caddy Server in Docker

[![Docker build][build-image]][hub-url]
[![Docker pulls][pulls-image]][hub-url]
[![Docker stars][stars-image]][hub-url]
[![Docker size][size-image]][size-url]


## Usage

```
docker pull ghcr.io/secbone/caddy
```

```
docker run -d -v /path/to/Caddyfile:/etc/caddy/Caddyfile -p 80:80 -p 443:443 ghcr.io/secbone/caddy
```


[pulls-image]: https://img.shields.io/docker/pulls/secbone/caddy.svg?style=flat-square
[hub-url]: https://hub.docker.com/r/secbone/caddy/
[stars-image]: https://img.shields.io/docker/stars/secbone/caddy.svg?style=flat-square
[size-image]: https://images.microbadger.com/badges/image/secbone/caddy.svg
[size-url]: https://microbadger.com/images/secbone/caddy
[build-image]: https://img.shields.io/docker/build/secbone/caddy.svg?style=flat-square
