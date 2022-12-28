#!/bin/bash
# Install and Setup Apache2, PHP and MySQL Client 
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