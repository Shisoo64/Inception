#!/bin/sh
echo "------------
Hello, i am the Maria DB container
------------"

# Updating
apk update
apk upgrade

mysql_install_db --datadir=/var/lib/mysql > /dev/null

chown -R mysql:mysql /var/lib/mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chmod -R 775 /run/mysqld

cd /usr/bin/
mysqld --defaults-file=/tmp/mariadb.conf --user=mysql &
PID="$!"

sleep 1

# Launching
echo "Creating database";
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -e "FLUSH PRIVILEGES;"


kill -s term "${PID}"
wait ${PID}


touch /tmp/endfile

# Launching
echo "Running Maria DB";
exec mysqld --defaults-file=/tmp/mariadb.conf --user=mysql