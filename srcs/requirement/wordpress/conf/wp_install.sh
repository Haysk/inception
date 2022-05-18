#!/usr/bin/env sh
cp /wordpress/wp-config.php /wordpress/tmp.php
eval "echo \"$(sed -n 1,33p /wordpress/tmp.php)\"" > /wordpress/wp-config.php
sed -n 34,99p /wordpress/tmp.php >> /wordpress/wp-config.php
rm /wordpress/tmp.php
mv /wordpress/ /var/www/
mkdir /run/php
touch /run/php/php7.3-fpm.sock
chown -R www-data:www-data /var/www/
chmod -R 755 /var/www/
php-fpm7.3 -F
