FROM debian:jessie-slim

RUN set -x \
    # Runtime dependencies.
 && apt-get update \
 && apt-get install -y \
        libcurl3 \
        libgmp10 \
        libjansson4 \
        libssl1.0.0 \
        openssl \
    # Build dependencies.
 && apt-get install -y \
        autoconf \
        automake \
        curl \
        g++ \
        git \
        libcurl4-openssl-dev \
        libjansson-dev \
        libssl-dev \
        libgmp-dev \
        make \
        pkg-config \
    # Compile from source code.
 && git clone --recursive https://github.com/magi-project/m-cpuminer-v2.git /tmp/cpuminer \
 && cd /tmp/cpuminer \
 && ./autogen.sh \
 && ./configure CFLAGS="-O3" CXXFLAGS="-O3" \
 && make install \
    # Install dumb-init (avoid PID 1 issues).
    # https://github.com/Yelp/dumb-init
 && curl -Lo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 \
 && chmod +x /usr/local/bin/dumb-init \
    # Clean-up
 && cd / \
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
        make \
        pkg-config \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* \
    # Verify
 && m-minerd --version

ADD start.sh /start.sh
RUN chmod 755 /start.sh

ENV PASSWORD=pass00
ENV URL="stratum+tcp://mining.m-hash.com:3334"
ENV ALGORITHM=m7mhash
ENV PRIORITY=19

ENTRYPOINT ["dumb-init"]
CMD ["/start.sh"]

