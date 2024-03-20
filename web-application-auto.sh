#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
yum install wget
wget https://github.com/awanmbandi/aws-real-world-projects/raw/web-appplications-src-code/medlife-health-care.zip -P ~/
yum install unzip -y
unzip ~/medlife-health-care.zip
rm -f /var/www/html/index.html
cp -rf medlife-master/* /var/www/html/
