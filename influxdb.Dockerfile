FROM influxdb
ADD collectd_types.db /usr/share/collectd/types.db
ADD influxdb.conf /etc/influxdb/influxdb.conf
