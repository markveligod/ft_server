#!/bin/bash

# config nginx
rm -rf ./etc/nginx/sites-available/default
mv ./default ./etc/nginx/sites-available/.
chown -R www-data:www-data ./var/www

# phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz 
mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin
mv phpmyadmin ./var/www
rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

# wordpress
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
mv wordpress ./var/www
rm latest.tar.gz
mv ./var/wp-config.php ./var/www/wordpress

# mysql
service mysql restart
echo "CREATE USER 'ckakuna'@'localhost';" | mysql -u root
echo "CREATE DATABASE local;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON local.* TO 'ckakuna'@'localhost' identified by 'ckakuna';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# certificat SSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < ./ssl.txt

# restart
service php7.3-fpm restart 
service nginx restart
bash
