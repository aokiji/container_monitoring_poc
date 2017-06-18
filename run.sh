#!/bin/sh

if [ ! -d "/mnt/proc" ]; then
  echo "You're running this without loopback mounting /proc.  You can run with '-v /proc:/mnt/proc:ro' when to do this."
  exit 1
fi

if [ ! -d /mnt/oldproc ]; then
	if [ -d /mnt/proc ]; then
		umount /proc
		mount -o bind /mnt/proc /proc
		mkdir /mnt/oldproc
		mount -t proc none /mnt/oldproc
	fi
fi

sed 's/%%%HOSTNAME%%%/'$COLLECTD_HOSTNAME'/g' -i /etc/collectd/collectd.conf

if [ -z "$@" ]; then
  exec collectd -C  /etc/collectd/collectd.conf -f
else
  exec "$@"
fi
