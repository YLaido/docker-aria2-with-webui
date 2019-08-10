#!/bin/sh
set -e

PUID=${PUID:=1000}
PGID=${PGID:=1000}
conf=/data/aria2

if [ ! -f $conf/aria2.conf ]; then
	mkdir -pv $conf
	cp /conf-copy/aria2.conf $conf/aria2.conf
	chown $PUID:$PGID $conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> $conf/aria2.conf
	fi
	touch $conf/aria2.session
	chown $PUID:$PGID $conf/aria2.session
	touch $conf/logs.txt
	chown $PUID:$PGID $conf/logs.txt
fi

darkhttpd /aria2-webui/docs --port 81 --daemon
darkhttpd /data --port 4 --daemon

exec s6-setuidgid $PUID:$PGID aria2c --conf-path=$conf/aria2.conf --log=$conf/logs.txt
