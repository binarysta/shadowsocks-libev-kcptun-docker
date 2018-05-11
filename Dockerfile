FROM ubuntu:bionic
LABEL maintainer "Alireza Eskandari <astro.alireza@gmail.com>"

#shadowsocks-libev
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends shadowsocks-libev \
    && rm -rf /var/log/dpkg.log /var/lib/apt/lists/* /var/log/apt/*

#kcptun
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends kcptun \
    && rm -rf /var/log/dpkg.log /var/lib/apt/lists/* /var/log/apt/*

# Supervisord
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends supervisor \
    && rm -rf /var/log/dpkg.log /var/lib/apt/lists/* /var/log/apt/*

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY shadowsocks-kcptun.supervisor.conf /etc/supervisor/conf.d/shadowsocks-kcptun.conf

EXPOSE 8388/tcp
EXPOSE 8388/udp
EXPOSE 29900/udp

ENTRYPOINT [ "/docker-entrypoint.sh" ]
