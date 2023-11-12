FROM debian:buster

WORKDIR /var/www/html/

RUN apt-get update -y && apt-get upgrade -y && apt-get -y install php7.3 php-fpm php-cli wget curl php-mysql php-mbstring php-xml sendmail

EXPOSE 9000

COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm7.3", "-F"]
