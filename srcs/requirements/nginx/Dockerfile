FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get -y install nginx openssl

EXPOSE 443

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt -subj /

COPY ./conf /etc/nginx/sites-available/

CMD ["nginx", "-g", "daemon off;"]
