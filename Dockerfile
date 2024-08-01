ARG VERSION=2.8.4

FROM caddy:$VERSION-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:$VERSION
LABEL maintainer "Secbone <secbone@gmail.com>"

VOLUME /etc/caddy /data /config /srv

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
