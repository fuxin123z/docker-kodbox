FROM alpine:3.11

# 作者信息
MAINTAINER DDNS Docker Maintainers "scjtqs@qq.com"
# Environments
ENV TIMEZONE            Asia/Shanghai
ENV PHP_MEMORY_LIMIT    512M
ENV MAX_UPLOAD          50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV PHP_MAX_POST        100M
ENV COMPOSER_ALLOW_SUPERUSER 1

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
##更新 镜像源
RUN echo -e "http://mirrors.aliyun.com/alpine/v3.11/main" > /etc/apk/repositories
RUN echo -e "\n" >> /etc/apk/repositories
RUN echo -e "http://mirrors.aliyun.com/alpine/v3.11/community" >> /etc/apk/repositories

RUN apk add \
                ca-certificates \
                bash \
                unzip \
                openssl \
                curl \
                apache2 \
                php7-apache2 \
                php7 php7-pecl-apcu php7-pecl-imagick php7-pecl-redis php7-pecl-uuid php7-pecl-mcrypt php7-pecl-oauth php7-pecl-ssh2 php7-pecl-memcached php7-pecl-protobuf php7-pecl-event  \
                php7-pdo php7-phar php7-sockets php7-soap php7-ftp php7-static php7-bz2 php7-simplexml php7-xmlwriter php7-curl php7-xml php7-json php7-openssl php7-sqlite3 php7-pear php7-pdo_mysql php7-xsl php7-mbstring php7-pdo_sqlite php7-opcache php7-recode php7-ldap php7-posix php7-session php7-gd php7-gettext php7-iconv php7-imap php7-zip php7-ctype php7-bcmath php7-dom php7-calendar php7-mysqli \
                   && mkdir -p /run/apache2 && mkdir -p /run/nginx \
                   && ln -sf /dev/stdout /var/log/apache2/access.log \
                   && ln -sf /dev/stderr /var/log/apache2/error.log \
                   && rm -rf /var/cache/apk/*


COPY httpd.conf /etc/apache2/
COPY php.ini /etc/php7/
COPY init.sh /

RUN adduser -D -g 'www' www \
    && chmod -R 0777 /var/www/localhost/htdocs \
    && chmod +x /init.sh


##下载kodbox
WORKDIR /var/www/localhost/htdocs

#STOPSIGNAL SIGQUIT

EXPOSE 9000
EXPOSE 80

ENTRYPOINT ["/init.sh"]
#CMD ["/usr/sbin/httpd","-f","/etc/apache2/httpd.conf","-DFOREGROUND"]
#CMD  /usr/sbin/php-fpm7  && nginx -g 'daemon off;'