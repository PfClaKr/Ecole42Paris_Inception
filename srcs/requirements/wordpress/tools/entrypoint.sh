#! /bin/bash

service php7.3-fpm start;
echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -f /var/www/html/wp-config.php ]; then
	curl -O "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp cli update
	wp core download --allow-root --path=/var/www/html/
	cd /var/www/html
	cp wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/$MARIADB_DATABASE/g" wp-config.php
	sed -i "s/username_here/$MARIADB_ROOT_USER/g" wp-config.php
	sed -i "s/password_here/$MARIADB_ROOT_PWD/g" wp-config.php
	sed -i "s/localhost/$WP_HOST/g" wp-config.php
	wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root --path=/var/www/html/
	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=editor --allow-root --path=/var/www/html/
fi

service php7.3-fpm stop;

exec "$@"
