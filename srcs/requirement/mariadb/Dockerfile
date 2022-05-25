FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server gettext-base -y
COPY conf/database_conf.sql /tmp/
COPY conf/mariadb_createdb.sh /tmp/
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
ENTRYPOINT ["sh", "/tmp/mariadb_createdb.sh"]
