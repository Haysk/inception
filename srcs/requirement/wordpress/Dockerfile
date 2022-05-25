FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget git curl vim libnss3-tools mariadb-client
RUN apt-get install php7.3 php7.3-fpm php7.3-mysql php7.3-cli php7.3-common php7.3-json php7.3-xml php7.3-opcache php7.3-readline php7.3-mbstring -y
#RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
#RUN tar -zxf latest-fr_FR.tar.gz
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/wp_install.sh /tmp/
COPY conf/www.conf /etc/php-fpm.d/
COPY conf/php-fpm.conf /etc/php/7.3/fpm/
#COPY conf/wp-config.php /wordpress
ENTRYPOINT [ "bash", "tmp/wp_install.sh" ] 
