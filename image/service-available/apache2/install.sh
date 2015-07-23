#!/bin/bash -e

# install apache
LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apache2

rm /etc/apache2/apache2.conf
ln -s /container/service-available/apache2/assets/config/apache2.conf /etc/apache2/apache2.conf
ln -s /container/service-available/apache2/assets/config/custom-security.conf /etc/apache2/conf-available/custom-security.conf
ln -s /container/service-available/apache2/assets/config/vhost-partial-ssl.conf /etc/apache2/conf-available/vhost-partial-ssl.conf

a2disconf security other-vhosts-access-log charset localized-error-pages serve-cgi-bin
a2enconf custom-security

a2enmod headers ssl
