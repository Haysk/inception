#!/usr/bin/env sh
#cp /wordpress/wp-config.php /wordpress/tmp.php
#eval "echo \"$(sed -n 1,33p /wordpress/tmp.php)\"" > /wordpress/wp-config.php
#sed -n 34,99p /wordpress/tmp.php >> /wordpress/wp-config.php
#rm /wordpress/tmp.php
#mv /wordpress/ /var/www/
chown -R www-data:www-data /var/www/
chmod -R 755 /var/www/
cd /var/www/
wp core --allow-root download
wp config create --dbname=$DATABASE_NAME --dbuser=$DB_WP_USER --dbpass=$DB_WP_PASSWORD --dbhost=$DATABASE --dbprefix=wp_ --allow-root
wp core install --url="adylewsk.42.fr" --title="INCEPTION" --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPASSWORD --admin_email="adylewsk@student.42.fr" --allow-root
wp user create toto toto@.com --user_pass=$WP_PASSWORD --allow-root
mkdir /run/php
touch /run/php/php7.3-fpm.sock
php-fpm7.3 -F
