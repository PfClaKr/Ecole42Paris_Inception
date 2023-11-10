FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

RUN sed -i "s/bind-address/#bind-adress/g" /etc/mysql/mariadb.conf.d/50-server.cnf

#COPY ./conf/dump.sql /tmp/dump.sql
#COPY ./temp/temp /temp
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#RUN service mysql start && mysql < /temp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
