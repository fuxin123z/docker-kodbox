#!/bin/bash
setenforce 0
if [ -f /var/www/localhost/htdocs/install.lock ];then
    echo 'kodbox installed'
    touch /var/www/localhost/htdocs/install.lock
else
#    curl  -k -o /var/www/kodexplorer4.40.zip https://pan.xxooxxoo.xyz:8444/f/29e55228097a4ced9b1d/?dl=1
    wget   -O /var/www/kodexplorer4.40.zip https://pan.xxooxxoo.xyz:8444/f/29e55228097a4ced9b1d/?dl=1
    unzip /var/www/kodexplorer4.40.zip -d /var/www/localhost/htdocs
    chown -R apache:apache /var/www
    chmod -R 777 /var/www/localhost/htdocs/
    rm /var/www/html/kodexplorer4.40.zip
    touch /var/www/localhost/htdocs/install.lock
fi
#/usr/sbin/php-fpm7 -R  && nginx -g 'daemon off;'
#/usr/bin/supervisord -c /supervisord.conf
/usr/sbin/httpd -f /etc/apache2/httpd.conf -DFOREGROUND