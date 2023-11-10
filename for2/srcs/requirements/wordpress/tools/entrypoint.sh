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
	sed -i "s/database_name_here/wordpress_db/g" wp-config.php
	sed -i "s/username_here/ychun/g" wp-config.php
	sed -i "s/password_here/1/g" wp-config.php
	sed -i "s/localhost/172.31.0.11/g" wp-config.php
	wp core install --url="https://ychun.42.fr" --title="Ychun inception" --admin_user="pfcla" --admin_password=1 --admin_email="ychun@42.fr" --allow-root --path=/var/www/html/
fi

service php7.3-fpm stop;

exec "$@"
