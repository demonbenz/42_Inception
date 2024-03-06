FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y

RUN apt-get install vim -y

RUN mkdir -p /etc/nginx/ssl

RUN apt-get install openssl -y

RUN openssl req -x509 \
	-nodes -out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=TH/ST=IDF/L=Bangkok/O=42/OU=42/CN=otangkab.42.fr/UID=otangkab"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
