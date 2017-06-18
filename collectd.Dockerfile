FROM debian:jessie
RUN apt-get update \
        && apt-get install -y -qq collectd \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD collectd.conf /etc/collectd/collectd.conf
ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]
