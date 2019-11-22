#!/bin/sh
set -e

PUID=${PUID:=1000}
PGID=${PGID:=1000}
conf=/data/aria2

if [ ! -f $conf/aria2.conf ]; then
	mkdir -pv $conf
	mv /aria2.conf $conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> $conf/aria2.conf
	fi
	touch $conf/aria2.session $conf/logs.txt
	chown -R $PUID:$PGID $conf
fi

darkhttpd /webui-aria2-master/docs --port 81 --daemon
darkhttpd /data --port 4 --daemon

exec s6-setuidgid $PUID:$PGID aria2c --conf-path=$conf/aria2.conf --log=$conf/logs.txt
