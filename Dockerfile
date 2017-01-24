# This is a comment
FROM ubuntu:16.04
MAINTAINER sebastiencaumes <sebastien.caumes@hotmail.fr>
RUN apt-get update && apt-get install -y software-properties-common iputils-ping vim inetutils-telnet

RUN add-apt-repository ppa:ondrej/php && apt-get -y update && apt-get install -y --allow-unauthenticated apache2 php5.6 php5.6-intl php-common \
php5.6-common php5.6-json php5.6-opcache php5.6-readline php5.6-cli php5.6-gd \
libapache2-mod-php5.6 libapache2-mod-fcgid apache2-doc apache2-utils php5.6-fpm php5.6-xml php-xdebug php5.6-zip php5.6-mbstring php5.6-dev \
php5.6-bcmath php5.6-mysql curl supervisor git openssh-server

#supervisor
RUN mkdir -p /var/log/supervisor /run/php/

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#php fpm
COPY php-fpm5.6.conf /etc/php/5.6/fpm/pool.d/www.conf

RUN a2enmod proxy rewrite proxy_fcgi setenvif headers && a2dismod php5.6 mpm_prefork && a2enmod mpm_worker
RUN chown -R www-data:www-data /usr/lib/cgi-bin
RUN touch /usr/lib/cgi-bin/php5.6-fcgi
RUN a2enconf php5.6-fpm

#composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

COPY vhost.conf /etc/apache2/sites-enabled/morpion.conf

RUN locale-gen fr_FR.UTF-8

RUN usermod -u 1001 www-data

EXPOSE 80 22
CMD ["/usr/bin/supervisord"]
