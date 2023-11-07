FROM debian:buster

ARG WP_DATABASE
ARG WP_USER
ARG WP_PASSWORD

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install php7.3 php-fpm php-cli wget curl php-mysql php-mbstring php-xml sendmail

EXPOSE 9000

RUN echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz && \
#	if [ !/var/www/html ]; then mkdir /var/www/html; fi && \
	mv /wordpress/* /var/www/html/ && \
	chown -R www-data:www-data /var/www/html && \
	rm -r /wordpress latest.tar.gz

RUN cd /var/www/html && \
	cp wp-config-sample.php wp-config.php && \
	sed -i "s/database_name_here/$WP_DATABASE/g" wp-config.php && \
	sed -i "s/username_here/$WP_USER/g" wp-config.php && \
	sed -i "s/password_here/$WP_PASSWORD/g" wp-config.php && \
	sed -i "s/localhost/mariadb/g" wp-config.php
ENTRYPOINT ["php-fpm7.3", "-F"]
