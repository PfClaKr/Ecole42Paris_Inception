#! /bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;" | mysql -uroot -p$MARIADB_ROOT_PWD
echo "CREATE USER '${MARIADB_ROOT_USER}'@'%' IDENTIFIED BY '${MARIADB_ROOT_PWD}';" | mysql -uroot -p$MARIADB_ROOT_PWD
echo "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '${MARIADB_ROOT_USER}'@'%';" | mysql -uroot -p$MARIADB_ROOT_PWD
echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MARIADB_ROOT_PWD

service mysql stop


exec "$@"
