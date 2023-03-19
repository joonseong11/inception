# #!/bin/sh

# mkdir -p /var/run/mysqld 
# chown -R mysql:mysql /var/run/mysqld

service mysql start
if [ ! -e /var/lib/mysql/$MYSQL_DATABASE ]; then
										# mariadb				1234
	mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE" -p$MYSQL_PASSWORD
										# jujeon						1234
	mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" -p$MYSQL_PASSWORD
										# mariadb			jujeon
	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; FLUSH PRIVILEGES;" -p$MYSQL_PASSWORD
															# 1234 
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" -p$MYSQL_PASSWORD
fi
			# root           1234
mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD shutdown
# mysql $MYSQL_DATABASE -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD
exec mysqld_safe