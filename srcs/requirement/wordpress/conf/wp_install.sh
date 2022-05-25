#!/usr/bin/env sh
chown -R www-data:www-data /var/www/
chmod -R 755 /var/www/
cd /var/www/
FILE=/var/www/.tmp
if [ ! -f "$FILE" ]
then
	wp core --allow-root download
	wp config create --dbname=$DATABASE_NAME --dbuser=$DB_WP_USER --dbpass=$DB_WP_PASSWORD --dbhost=$DATABASE --dbprefix=wp_ --allow-root
	wp core install --url="adylewsk.42.fr" --title="INCEPTION" --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPASSWORD --admin_email="adylewsk@student.42.fr" --allow-root
	wp user create $WP_USER toto@toto.com --user_pass=$WP_PASSWORD --allow-root
	touch /var/www/.tmp
fi
mkdir /run/php
touch /run/php/php7.3-fpm.sock
php-fpm7.3 -F
