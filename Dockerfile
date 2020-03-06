FROM alpine
LABEL maintainer "Secbone <secbone@gmail.com>"

ARG VERSION=v2.0.0-beta.15
ARG DOWNLOAD_URL=https://github.com/caddyserver/caddy/releases/download/$VERSION/caddy2_beta15_linux_amd64
LABEL caddy_version="$VERSION"

WORKDIR /srv

RUN wget -O /usr/bin/caddy $DOWNLOAD_URL && chmod +x /usr/bin/caddy

EXPOSE 80 443

COPY Caddyfile /srv/Caddyfile
COPY index.html /www/index.html

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/srv/Caddyfile"]
