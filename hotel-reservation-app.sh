#!/bin/bash
sudo apt update -y
sudo apt -y install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt install wget -y
sudo systemctl status apache2
sudo wget https://github.com/awanmbandi/aws-real-world-projects/raw/web-appplications-src-code/star-hotels-master.zip -P ~/
sudo apt install unzip -y
sudo unzip star-hotels-master.zip 
sudo rm -f /var/www/html/index.html
sudo cp -rf star-hotels-master/* /var/www/html/
