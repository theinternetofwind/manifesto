#!/bin/bash
makepidfile=/var/tmp/make-develop.pid
serverpidfile=/var/tmp/http-server.pid

thisscript=`basename $0`

helptext(){
	echo "usage: $thisscript [ start | stop | restart ]"
	echo
	exit 1
}

if [ $# -eq 0 ]; then
	mode=start
else
	mode=$1
fi

kill_and_clean(){
	for i in $makepidfile $serverpidfile; do
		if [ -e $i ]; then
			kill `cat $i`;
			rm $i
			sleep 1;
		fi
	done
}

start_all(){
	echo "building (with watcher)"
	cd /vagrant
	make develop &
	echo $! > $makepidfile

	sleep 2
	echo "starting server"
	echo "NOTE: actual localhost port is specified in Vagrantfile"
	cd /vagrant/build
	http-server -p 3000 &
	echo $! > $serverpidfile
}

case "$mode" in
	"start")
		start_all;
		;;
	"stop")
		kill_and_clean;
		;;
	"restart")
		kill_and_clean;
		start_all;
		;;
	*) helptext ;
		;;
esac
