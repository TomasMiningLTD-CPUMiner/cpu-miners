FROM debian:jessie-slim

RUN set -x \
    # Runtime dependencies.
 && apt-get update \
 && apt-get install -y curl wget \
 && curl -Lo /tmp/deb-cli https://fr.minergate.com/download/deb-cli \
 && dpkg --install /tmp/deb-cli \
    # Install dumb-init (avoid PID 1 issues).
    # https://github.com/Yelp/dumb-init
 && curl -Lo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 \
 && chmod +x /usr/local/bin/dumb-init \
    # Clean-up
 && cd / \
 && apt-get purge --auto-remove -y wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/*

ADD start.sh /start.sh
RUN chmod 755 /start.sh

ENV PASSWORD=x
ENV ALGORITHM=bcn
ENV PRIORITY=19

ENTRYPOINT ["dumb-init"]
CMD ["/start.sh"]
