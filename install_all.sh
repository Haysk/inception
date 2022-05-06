# install_nginx
rm /etc/nginx/sites-enabled/default
cp /root/nginx_config /etc/nginx/sites-available/dylews
ln -s /etc/nginx/sites-available/dylews /etc/nginx/sites-enabled/

# install_database
service mysql start
mysql -u root --skip-password < /root/database_conf.sql

#install_SSL
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
mv mkcert-v1.4.3-linux-amd64 usr/local/bin/mkcert
chmod +x /usr/local/bin/mkcert
mkcert -install
cd /root/.local/share/mkcert/ && mkcert dylews


# install_wordpress
cd
wget https://fr.wordpress.org/latest-fr_FR.tar.gz
tar -zxf latest-fr_FR.tar.gz
mv wordpress /var/www/dylews
mv /root/wp-config.php /var/www/dylews/wordpress/

# install_phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
tar -zxf phpMyAdmin-5.1.0-english.tar.gz
mv phpMyAdmin-5.1.0-english /var/www/dylews/phpmyadmin
mv /root/config.inc.php /var/www/dylews/phpmyadmin/

chown -R www-data:www-data /var/www/dylews/
chmod -R 755 /var/www/dylews/

if [[ $AUTOINDEX == "off" ]]
then
	sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/dylews
fi
service mysql restart
service nginx start
service php7.3-fpm start

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
