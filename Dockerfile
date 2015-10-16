FROM ubuntu:14.04
MAINTAINER landon.wu@fetles.com

RUN \
  apt-get update && \
  apt-get install -y rsyslog && \
  apt-get install -y supervisor && \
  apt-get install -y squid python-pip && \
  rm -rf /var/lib/apt/lists/

RUN \
  pip install requests

COPY files/etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY files/etc/squid.conf /etc/squid3/squid.conf
COPY files/unblock /opt/unblock

EXPOSE 8888
CMD ["/usr/bin/supervisord"]
