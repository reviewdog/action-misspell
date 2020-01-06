FROM alpine:3.10

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ v0.9.15
RUN wget -O - -q https://git.io/misspell | sh -s -- -b /usr/local/bin/

RUN apk --no-cache add git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
