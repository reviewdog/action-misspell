FROM alpine:3.19

ENV REVIEWDOG_VERSION=v0.16.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN wget -O - -q https://raw.githubusercontent.com/client9/misspell/master/install-misspell.sh | sh -s -- -b /usr/local/bin/

RUN apk --no-cache add git && \
    apk --no-cache add bash && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
