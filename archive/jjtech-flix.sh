#! /bin/bash 
sudo apt update -y 
sudo apt -y install apache2 
sudo systemctl start apache2 
sudo systemctl enable apache2 
sudo apt install wget -y 
sudo wget https://github.com/awanmbandi/google-cloud-projects/raw/jjtech-flix-app/jjtech-streaming-application-v1.zip 
sudo apt install unzip -y 
sudo unzip jjtech-streaming-application-v1.zip 
sudo rm -f /var/www/html/index.html 
sudo cp -rf jjtech-streaming-application-v1/* /var/www/html/ 
