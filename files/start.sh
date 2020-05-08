#!/bin/sh
set -e

PUID=${PUID:=1000}
PGID=${PGID:=1000}
conf=/root/conf

if [ ! -f $conf/aria2.conf ]; then
	mkdir -pv $conf
	mv /aria2.conf $conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> $conf/aria2.conf
	fi
	touch $conf/aria2.session $conf/aria2.log
	chown -R $PUID:$PGID $conf
fi

darkhttpd /AriaNg-DailyBuild-master --port 7889 --daemon
darkhttpd /data --port 4 --daemon

exec s6-setuidgid $PUID:$PGID aria2c --conf-path=$conf/aria2.conf --log=$conf/aria2.log
