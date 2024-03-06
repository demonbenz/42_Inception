# Install os penultimate version is debian 11
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget -y

# Install php
RUN apt-get -y install php php-fpm \
	php-cgi php-mysql \
	php-pdo php-gd php-cli php-mbstring

RUN rm -rf /var/lib/apt/lists/*

# Install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php

COPY ./tools/entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

CMD [ "/usr/sbin/php-fpm7.4", "-F" ]
