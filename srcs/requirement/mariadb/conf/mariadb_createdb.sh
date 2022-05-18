#!/usr/bin/env sh
service mysql start
eval "echo \"$(cat /tmp/database_conf.sql)\"" | mariadb
mysqld_safe
