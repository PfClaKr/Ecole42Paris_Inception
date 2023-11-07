#! /bin.bash

service php7.3-fpm start;
echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -f /var/www/html/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root --path=/var/www/html/
	wp core config --dbname=wordpress_db --dbuser=ychun --dbpass=1 --dbhost=mariadb --dbprefix=wp_ --allow-root --path=/var/www/html/
	wp core install --url=https://ychun.42.fr --title="Ychun inception" --admin_user=pfcla --admin_password=1 --admin_email=ychun@42.fr --allow-root --path=/var/www/html/
fi

service php7.3-fpm stop;

exec "$@"
