# FROM	debian:buster

# # RUN		apt-get update -y && \
# # 		apt-get upgrade -y && \
# # 		apt-get -y install \
# # 		mariadb-client \
# # 		php-mysql \
# # 		php-mbstring \
# # 		wget \
# # 		tar \
# # 		php7.3-fpm \
# # 		vim

# RUN		apt-get update -y && \
# 		apt-get upgrade -y && \
# 		apt-get -y install \
# 		mariadb-client \
# 		wget \
# 		curl \
# 		tar \
# 		php7.3-fpm \
# 		php-cli \
# 		php-mysql \
# 		vim \
# 		sudo

# # RUN		wget https://wordpress.org/latest.tar.gz
# # RUN		tar -xvzf latest.tar.gz
# # RUN		mkdir -p /var/www/html/wordpress
# # RUN		mv wordpress/ var/www/html/

# COPY	./tools/wordpress_setup.sh /tmp/wordpress_setup.sh
# COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
# # COPY 	./run.sh ./
# RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

# # RUN 	mkdir -p /var/www/html
# # RUN 	mkdir -p /var/www/html/wordpress
# # RUN		chown -R www-data:www-data /var/www/html/wordpress

# WORKDIR	/var/www/html/wordpress
# RUN		mkdir -p /run/php

# # COPY	./tmp/phpinfo.php /var/www/html/phpinfo.php

# EXPOSE	9000

# # CMD		bash run.sh && service php7.3-fpm start && tail -f /dev/null
# # CMD		service php7.3-fpm start && tail -f /dev/null
# ENTRYPOINT ["sh", "/tmp/wordpress_setup.sh"]

FROM	debian:buster

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-client \
		wget \
		curl \
		tar \
		php7.3-fpm \
		php-cli \
		php-mysql \
		vim \
		sudo


# RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp
COPY	./tools/wordpress_setup.sh /tmp/wordpress_setup.sh
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY	./tools/wp-config.php /tmp/wp-config.php

WORKDIR	/var/www/html/wordpress
RUN		mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT ["sh", "/tmp/wordpress_setup.sh"]