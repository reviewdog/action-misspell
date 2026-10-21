FROM debian:bookworm-slim@sha256:7ff6ba31527b9e336162fa061746c366c4b2032f4d2cff2078bea43f78efe3f8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV REVIEWDOG_VERSION=v0.21.2
ENV MISSPELL_VERSION=v0.8.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/fd59714416d6d9a1c0692d872e38e7f8448df4fc/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN wget -O - -q https://raw.githubusercontent.com/golangci/misspell/master/install-misspell.sh | sh -s -- -b /usr/local/bin/ "${MISSPELL_VERSION}"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
