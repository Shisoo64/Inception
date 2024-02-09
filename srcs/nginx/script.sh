#!/bin/sh
echo "------------
Hello, i am the nginx container
------------"

adduser -D -u 4348 -G nginx nginx
# Updating
apk update
apk upgrade

mkdir -p /var/www/html
chown -R nginx:nginx /var/lib/nginx
chown -R nginx:nginx /var/www/html
chmod -R 755 /var/www/html

# Launching
echo "Running Nginx";
exec nginx -g 'daemon off;'