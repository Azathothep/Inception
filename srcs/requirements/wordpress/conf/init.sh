mkdir /run/php

cat conf/www.conf > /etc/php/7.3/fpm/pool.d/www.conf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
wp core download --allow-root

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/database_name_here/$MARIADB_DATABASE/" /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/username_here/$MARIADB_USER/" /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/password_here/$MARIADB_PASSWORD/" /var/www/html/wordpress/wp-config.php \
&&		sed -i "s/localhost/$MARIADB_HOST/" /var/www/html/wordpress/wp-config.php

if ! wp core is-installed --allow-root
then
	wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL
	wp theme install twentysixteen --activate --allow-root
fi

php-fpm7.3 -F