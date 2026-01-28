#!/bin/bash
sudo apt update -y 
sudo apt -y install apache2 
sudo systemctl start apache2 
sudo systemctl enable apache2 
sudo apt install wget -y 
sudo wget https://github.com/awanmbandi/aws-real-world-projects/raw/web-appplications-src-code/medlife-health-care.zip -P ~/
sudo apt install unzip -y 
sudo unzip ~/medlife-health-care.zip
sudo rm -f /var/www/html/index.html
sudo cp -rf medlife-master/* /var/www/html/
