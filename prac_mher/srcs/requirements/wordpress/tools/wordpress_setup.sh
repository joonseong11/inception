#!/bin/sh

# chown -R www-data:www-data /var/www/

if [ ! -f "/var/www/html/wordpress/index.php" ]; then
	# echo wordpress_test1
	# cd /var/www/html/wordpress/
	# echo wordpress_test2

	# sudo -u www-data sh -c " \
	# wp core download --locale=$WORDPRESS_LANG \
	# wp config create --dbname=$WORDPRESS_DB_HOST --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbcharset="utf8" \
	# wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_DB_ADMIN_PASSWORD --admin_email=$WORDPRESS_DB_ADMIN_EMAIL --skip-email && \
	# wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD && \
	# wp plugin update --all \
	# "
	# echo wordpress_test3

	mkdir -p /var/www/html
  chown -R www-data:www-data /var/www/html
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  wp core download --allow-root
  mv /tmp/wp-config.php /var/www/html/wordpress
  # wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
  wp core install --url=https://jujeon.42.fr --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_DB_ADMIN_PASSWORD --admin_email=$WORDPRESS_DB_ADMIN_EMAIL --skip-email --allow-root
  wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD --allow-root && \
  wp plugin update --all --allow-root
fi

exec "php-fpm7.3" "-F"

# fi

# exec /usr/sbin/php-fpm7.3 -F