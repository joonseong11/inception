# #!/bin/sh

# set -e

# MYSQL_SETUP_FILE=/var/lib/mysql/.setup

# service mysql start;

# if [ ! -e $MYSQL_SETUP_FILE ]; then # 처음에만 실행되도록 하기 위해서

# 	# mysql -e : mysql 에서 명령을 실행하라는 의미
	
# 	mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
# 	mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
# 	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'";
# 	# 변경사항을 적용하라는 의미
# 	# root 계정의 비밀번호를 변경한다.
# 	mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";
# 	mysql -e "FLUSH PRIVILEGES";
# 	# mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '1234'";

# 	# mysql $MYSQL_DATABASE -u$MYSQL_ROOT -p1234
# 	# mysql $MYSQL_DATABASE -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD
# 	# mysqladmin -u$MYSQL_ROOT -p1234 shutdown
# 	# mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD shutdown

# 	touch $MYSQL_SETUP_FILE
# fi

# exec mysqld --console

set -e

service mysql start

if [ ! -e /var/lib/mysql/$MYSQL_DATABASE ]; then
	mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
	mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; FLUSH PRIVILEGES;"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
fi

mysql $MYSQL_DATABASE -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD
mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD shutdown

exec "mysqld_safe"