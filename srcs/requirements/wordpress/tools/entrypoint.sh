#!/bin/sh

if [ -f "var/www/html/wp-config.php" ]
then
	echo "wordpress already downloaded"
else
	echo "Try to download wordpress"
	mkdir -p /var/www/html
	cd /var/www/html
	wp core download --allow-root

	cp wp-config-sample.php wp-config.php
	sed -i "s/username_here/$DB_USER/g" wp-config.php
	sed -i "s/password_here/$DB_PASSWD/g" wp-config.php
	sed -i "s/localhost/$DB_HOST/g" wp-config.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config.php

	wp core install --url=$DOMAIN_NAME --title=$TITLE \
	--admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWD \
	--admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWD --allow-root

fi

exec "$@"
