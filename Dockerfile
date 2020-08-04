ARG ALPINE_VER

FROM alpine:${ALPINE_VER:-3.8}

ARG ALPINE_DEV

RUN set -xe; \
    \
    apk add --update --no-cache \
        bash \
        ca-certificates \
        curl \
        gzip \
        tar \
        unzip \
        wget; \
    \
    if test -n "${ALPINE_DEV}" ; then \
        apk add --update git coreutils jq sed gawk grep; \
    fi; \
    \
    rm -rf /var/cache/apk/*

COPY bin /usr/local/bin/

RUN get_ts_gotpl
