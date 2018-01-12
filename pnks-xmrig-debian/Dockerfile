FROM debian:stretch-slim

RUN set -x \
    # Runtime dependencies.
 && apt-get update \
 && apt-get install -y \
        libcurl3 \
        libgmp10 \
        libjansson4 \
        libmicrohttpd12 \
        openssl \
    # Build dependencies.
 && apt-get install -y \
        autoconf \
        automake \
        build-essential \
        cmake \
        curl \
        g++ \
        git \
        libcurl4-openssl-dev \
        libjansson-dev \
        libssl-dev \
        libgmp-dev \
        libuv1-dev \
        libmicrohttpd-dev \
        make \
        pkg-config \
    # Compile from source code.
 && git clone --recursive https://github.com/xmrig/xmrig.git /tmp/xmrig \
 && cd /tmp/xmrig \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make \
    # Install dumb-init (avoid PID 1 issues).
    # https://github.com/Yelp/dumb-init
 && curl -Lo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 \
 && chmod +x /usr/local/bin/dumb-init \
    # Clean-up
 && cd / \
 && apt-get clean \
 && apt-get purge --auto-remove -y \
        autoconf \
        automake \
        curl \
        g++ \
        git \
        libcurl4-openssl-dev \
        libjansson-dev \
        libssl-dev \
        libgmp-dev \
        libuv1-dev \
        libmicrohttpd-dev \
        make \
        pkg-config \
 && rm -rf /var/lib/apt/lists/* \
 && mv /tmp/xmrig/build/xmrig /usr/local/bin/xmrig \
 && rm -rf /tmp/* \
    # Verify
 && xmrig --version

ADD start.sh /start.sh
RUN chmod 755 /start.sh

ENV PASSWORD=x
ENV URL="stratum+tcp://pinkstar.blockhunter.xyz:3333"
ENV ALGORITHM=cryptonight
ENV PRIORITY=19

ENTRYPOINT ["dumb-init"]
CMD ["/start.sh"]
