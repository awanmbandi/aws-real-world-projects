sudo apt update 
sudo apt-get install apache2 -y
sudo apt-get install php-mysql -y

sudo apt install mysql-client-core-8.0
sudo apt install mariadb-client-core-10.3

ls /var/www/html
cd /var/www/html

sudo vi dbinfo.inc.php
## Copy and Past the Below Data in the file after updating
```bash
<?php

define('DB_SERVER', 'prod-database.cee2jhm51ydc.us-west-1.rds.amazonaws.com');
define('DB_USERNAME', 'admin');
define('DB_PASSWORD', 'admin2022');
define('DB_DATABASE', 'phpappdatabase');

?>
```
## Add the Application Code
sudo touch SamplePage.php
sudo vi SamplePage.php

## Try connecting to MySQL Database 
## Provide your database password when prompted
mysql -u admin -h php-app-database.cee2jhm51ydc.us-west-1.rds.amazonaws.com -p

## Test Application Server Connection With Database 
telnet YOUR_RDS_DATABASE_ENDPOINT 3306
telnet php-app-database.cee2jhm51ydc.us-west-1.rds.amazonaws.com 3306

#########################################################################################################
#UPDATE BACKEND LB TARGET GROUP: The Backend Load Balancer Target Group with the below health check path#
#ALSO UPDATE THE FRONTEND LB TARGET GROUP: With the same HEALTH PATH "/SamplePage.php"                  #
#########################################################################################################
Path: /SamplePage.php


####################################################################################################################
#UPDATE THE WEBSERVER APACHE2 PROXY CONFIG FILE: With the Backend External Load Balancer DNS WITH "/SamplePage.php"#
####################################################################################################################
<VirtualHost *:80>

    ProxyPass / http://INTERNAL_LOAD_BALANCER_DNS/SamplePage.php/

</VirtualHost>


####################################################################################################################
## Verify Data Was Stored In The Database  :::::: DATABASE QUERIES                                                 #
####################################################################################################################
SHOW DATABASES;

USE phpappdatabase;

SELECT * FROM EMPLOYEES;

SHOW TABLES;

## Show Table Options
SHOW FULL TABLES;

SHOW TABLES FROM database_name;

## Delete some data on the Database and make sure it reflects on the App
DELETE FROM EMPLOYEES
WHERE ID = 1;

## Confirm that Data was deleted
SELECT * FROM EMPLOYEES;

# When Verifying on the Browser, Make sure to DELETE the previous TAB, `COPY` the Whole LINK again and PASTE on a NEW TAB then TEST/REFRESH





