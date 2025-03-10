FROM ghcr.io/linuxserver/baseimage-alpine:3.21

ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"
ENV TZ Europe/Berlin

RUN apk --no-cache add bash tzdata tor=0.4.8.14-r1

EXPOSE 9001 9030

# TOR configuration through environment variables.
ENV RELAY_TYPE relay
ENV TOR_ORPort 9001
ENV TOR_DirPort 9030
ENV TOR_DataDirectory /data
ENV TOR_ContactInfo "Random Person nobody@tor.org"

# Copy the default configurations.
COPY torrc.bridge.default /config/torrc.bridge.default
COPY torrc.relay.default /config/torrc.relay.default
COPY torrc.exit.default /config/torrc.exit.default

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

COPY /root /
RUN chmod 755 /etc/services.d/tor/run

# Create and set permissions on data directory
RUN mkdir -p /data && \
    chmod 700 /data

VOLUME /data