#
# Builder
#
FROM abiosoft/caddy:builder as builder

ARG version="1.0.0"
ARG plugins="git,cors,realip,expires,cache,cloudflare,dnspod,godaddy,googlecloud,linode"
ARG enable_telemetry="true"

# process wrapper
RUN go get -v github.com/abiosoft/parent

RUN VERSION=${version} PLUGINS=${plugins} ENABLE_TELEMETRY=${enable_telemetry} /bin/sh /usr/bin/builder.sh

#
# Final stage
#
FROM alpine:3.8
LABEL maintainer "Secbone <secbone@gmail.com>"

ARG version="1.0.0"
LABEL caddy_version="$version"

# Let's Encrypt Agreement
ENV ACME_AGREE="true"

# Telemetry Stats
ENV ENABLE_TELEMETRY="$enable_telemetry"

RUN apk add --no-cache openssh-client git

# install caddy
COPY --from=builder /install/caddy /usr/bin/caddy

EXPOSE 80 443
VOLUME /root/.caddy /srv
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile
COPY index.html /srv/index.html

# install process wrapper
COPY --from=builder /go/bin/parent /bin/parent

ENTRYPOINT ["/bin/parent", "caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout", "--agree=$ACME_AGREE"]