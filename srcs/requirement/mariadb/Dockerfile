FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server  -y
ADD conf/database_conf.sql /tmp/
ADD conf/mariadb_createdb.sh /tmp/
ADD conf/my.cnf /etc/mysql/mariadb.conf.d/
CMD bash /tmp/mariadb_createdb.sh
