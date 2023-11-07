FROM debian:buster

ARG WP_USER
ARG WP_PASSWORD
ARG WP_DATABASE

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

RUN sed -i "s/bind-address/#bind-adress/g" /etc/mysql/mariadb.conf.d/50-server.cnf

#COPY ./conf/dump.sql /tmp/dump.sql
COPY ./temp /var/www/
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN service mysql start && mysql < /var/www/temp
#"CREATE DATABASE $WP_DATABASE;\
#	CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_PASSWORD';\
#	GRANT ALL ON $WP_DATABASE.* TO '$WP_USER'@'%';\
#	FLUSH PRIVILEGES;"
RUN service mysql stop

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
