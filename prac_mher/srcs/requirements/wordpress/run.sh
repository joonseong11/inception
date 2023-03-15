#!/bin/bash

# if [ ! -f index.php ]
# then
# 	wget https://wordpress.org/latest.tar.gz
# 	tar -xvzf latest.tar.gz
# 	mkdir -p /var/www/html/wordpress 
# 	mv wordpress/ var/www/html
# fi

# WORD_SETUP_FILE=/var/lib/wordpress/.setup

if [ ! -f check ]; then
	wget https://wordpress.org/latest.tar.gz
	tar -xvzf latest.tar.gz
	mkdir -p /var/www/html/wordpress 
	mv wordpress/ var/www/html
	touch check
fi