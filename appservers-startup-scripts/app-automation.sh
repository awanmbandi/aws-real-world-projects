#!/bin/bash
# Install and Setup Apache2, PHP and MySQL Client
#1. Get the latest bug fixes and security updates by updating the software on your EC2 instance. 
sudo yum update -y

#2. Install the PHP software using the amazon-linux-extras install command. 
#This command installs multiple software packages and related dependencies at the same time.
sudo amazon-linux-extras install php8.0 mariadb10.5 -y

#3. Install the Apache App server.
sudo yum install -y httpd

#4. Start the web server with the command shown following
sudo systemctl start httpd

#5. Configure the web server to start with each system boot using the systemctl command
sudo systemctl enable httpd

#6. SET FILE PERMISSIONS FOR APACHE
sudo usermod -a -G apache ec2-user

#7. Change the group ownership of the /var/www directory and its contents to the apache group.
sudo chown -R ec2-user:apache /var/www

#8. Change the directory permissions of /var/www and its subdirectories to add group write permissions....  
#    and set the group ID on subdirectories created in the future.
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;

#9. Recursively change the permissions for files in the /var/www directory and its subdirectories to add group write permissions.
find /var/www -type f -exec sudo chmod 0664 {} \;

mkdir /var/www/inc

#10. Create a new file in the ``inc`` directory named ``dbinfo.inc``
# UPDATE S3 BUCKET/OBJECT NAME
aws s3 cp s3://prod-proxy-app-db-config-aak-10/dbinfo.inc /var/www/inc

#11. Create a new file in the ``html`` directory named VenturaMailingApp.php, 
# UPDATE S3 BUCKET/OBJECT NAME
aws s3 cp s3://prod-proxy-app-db-config-aak-10/VenturaMailingApp.php /var/www/html

