FROM ubuntu:14.04
MAINTAINER landon.wu@fetles.com

RUN \
  apt-get update && \
  apt-get install -y squid && \
  rm -rf /var/lib/apt/lists/

COPY etc/squid.conf /etc/squid3/squid.conf

EXPOSE 8888
ENTRYPOINT ["/usr/sbin/squid3", "-N"]
