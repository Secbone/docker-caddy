ARG VERSION=2.10.0

FROM caddy:$VERSION-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare
    --with github.com/mholt/caddy-l4

FROM caddy:$VERSION
LABEL maintainer "Secbone <secbone@gmail.com>"

VOLUME /etc/caddy /data /config /srv

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
