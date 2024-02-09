#!/bin/sh
echo "------------
Hello, i am the php container
------------"


echo "------------
Updating
------------"
apk update
apk upgrade


echo "------------
Creating users
------------"
adduser -D -u 6969 -G www-data www-data

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html


echo "------------
Installing WordPress
------------"
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

echo "------------
WP-CLI chmodding and bails
------------"
chmod u+x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp cli version


echo "------------
CP WWW.CONF
------------"
cp /tmp/www.conf /etc/php81/php-fpm.d/www.conf

echo "------------
WordPress install
------------"
cd /var/www/html
wp core download
wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PWD} --dbhost=mariadb
wp core install --url=${DOMAIN_NAME} --title=${MYSQL_DATABASE} --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
wp user create chjoie chjoie.42@student.fr --porcelain

chmod -R 755 /var/www/html


echo "------------
Launching PHP
------------"
exec php-fpm81 -F -R