#!/bin/bash
# Install and Setup Apache2 and PHP Version 7
sudo apt-get -y install apache2
sudo locale-gen en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt-get update 
sudo apt-get install -y software-properties-common python-software-properties
sudo LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
sudo apt-get update 
sudo apt-get -y install php7.0 php7.0-curl php7.0-bcmath php7.0-intl php7.0-gd php7.0-dom php7.0-mcrypt php7.0-iconv php7.0-xsl php7.0-mbstring php7.0-ctype php7.0-zip php7.0-pdo php7.0-xml php7.0-bz2 php7.0-calendar php7.0-exif php7.0-fileinfo php7.0-json php7.0-mysqli php7.0-mysql php7.0-posix php7.0-tokenizer php7.0-xmlwriter php7.0-xmlreader php7.0-phar php7.0-soap php7.0-mysql php7.0-fpm libapache2-mod-php7.0
sudo sed -i -e"s/^memory_limit\s*=\s*128M/memory_limit = 512M/" /etc/php/7.0/apache2/php.ini
sudo apt-get install wget -y

# Check Apache and PHP Version
apache2 -v
php -v

# Restart and Enable the Apache2 Service
sudo a2enmod rewrite
sudo a2enmod headers
sudo service apache2 restart
sudo service apache2 enable

# Install AWSCLI
sudo apt-get install awscli -y

# Copy the Apache2 Proxy Config File From S3
# UPDATE S3 BUCKET/OBJECT NAME
sudo rm /etc/apache2/sites-available/000-default.conf
sudo aws s3 cp s3://prod-proxy-app-db-config-aak-10/000-default.conf /etc/apache2/sites-available/

# Enable Apache2 Reverse Proxy
sudo a2enmod proxy 
sudo a2enmod proxy_http
sudo systemctl restart apache2

####################################################################################################################
# Only "ENABLE" The Bellow Modules When You Do Not Have a Backend Load Balancer In Case Where You Have Multiple VMs#
####################################################################################################################
#sudo a2enmod proxy_balancer
#sudo a2enmod lbmethod_byrequests
