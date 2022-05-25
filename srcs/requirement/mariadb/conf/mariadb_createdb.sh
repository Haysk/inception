#!/usr/bin/env sh
set -xv
FILE=/var/lib/mysql/.tmp
if [ ! -f "$FILE" ]
then
	service mysql start
	envsubst < /tmp/database_conf.sql > /tmp.sql
	mysql < /tmp.sql
	service mysql stop
	touch /var/lib/mysql/.tmp
fi
exec mysqld_safe
