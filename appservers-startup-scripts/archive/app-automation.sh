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

#7. Log out to refresh your permissions and include the new apache group
exit 

#8. Log back in again and verify that the apache group exists with the groups command
groups 

#8.OUTPUT:DO NOT RUN Your output looks similar to the following:
ec2-user adm wheel apache systemd-journal

#9. Change the group ownership of the /var/www directory and its contents to the apache group.
sudo chown -R ec2-user:apache /var/www

#10. Change the directory permissions of /var/www and its subdirectories to add group write permissions....  
#    and set the group ID on subdirectories created in the future.
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;

#11. Recursively change the permissions for files in the /var/www directory and its subdirectories to add group write permissions.
find /var/www -type f -exec sudo chmod 0664 {} \;

# NOTE NOTE: Now, ec2-user (and any future members of the apache group) can add, delete, and edit files in the Apache document root..... 
#            without requiring Root privileges. This makes it possible for you to add content or deploy applications
#            like our PHP application without running into Permission Issues.

# CONNECT YOUR APPLICATION SERVERS TO YOUR DATABASE
#1. Change the directory to ``/var/www`` and create a new subdirectory named ``inc``
cd /var/www
ls -al
mkdir inc
cd inc

#2. Create a new file in the ``inc`` directory named ``dbinfo.inc``, and then edit the file by calling ``vi`` (or any other editor of your choice).
aws s3 cp s3://prod-proxy-app-db-config-aak-10/dbinfo.inc .

#3. (OPTIONAL!!!) If you did not copy fro your s3 Bucket.
#3. (OPTIONAL!!!) If you did not copy fro your s3 Bucket.
#3. (OPTIONAL!!!) If you did not copy fro your s3 Bucket. Add the following contents to the dbinfo.inc file. Here, db_instance_endpoint is your DB instance endpoint,.... 
#   without the port, and master password is the master password for your DB instance
```bash
<?php

define('DB_SERVER', 'db_instance_endpoint');
define('DB_USERNAME', 'tutorial_user');
define('DB_PASSWORD', 'master password');
define('DB_DATABASE', 'sample');

?>
```

#4. Save and close the ``dbinfo.inc`` file.

#5. (CONTINUE!!) FROM HERE
#5. Change the directory to /var/www/html
cd /var/www/html

#6. Create a new file in the ``html`` directory named VenturaMailingApp.php, 
#   and then edit the file by calling ``vi`` (or the editor of your choice).
vi VenturaMailingApp.php

#7. Add the following contents to the ``VenturaMailingApp.php`` file. COPY APP CODE FROM THE LINK BELOW
Link: https://github.com/awanmbandi/aws-real-world-projects/blob/three-tier-mailing-app-project/appservers-startup-script/VenturaMailingApp.php

#8. Save and close the SamplePage.php file

#9. Verify that your web server successfully connects to your DB instance by opening a web browser and browsing to
Access Application: http://BACKEND_LOAD_BALANCER_DNS/VenturaMailingApp.php


## Try connecting to MySQL Database 
## Provide your database password when prompted
mysql -u admin -h php-app-database.cee2jhm51ydc.us-west-1.rds.amazonaws.com -p

## Test Application Server Connection With Database 
telnet YOUR_RDS_DATABASE_ENDPOINT 3306
telnet php-app-database.cee2jhm51ydc.us-west-1.rds.amazonaws.com 3306

