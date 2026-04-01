#!/bin/bash

# Log everything (VERY IMPORTANT for debugging)
exec > /var/log/user-data.log 2>&1

echo "STARTING SETUP..."

# Update system
apt-get update -y
apt-get upgrade -y

# Install MySQL Server
DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# Start and enable MySQL
systemctl start mysql
systemctl enable mysql

# Wait to ensure MySQL is ready
sleep 10

# Configure MySQL for remote access
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL after config change
systemctl restart mysql

# Create DB + user (secure + reliable method)
mysql <<EOF
CREATE USER 'admin'@'%' IDENTIFIED BY 'adminadmin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
EOF

# Ensure MySQL listens properly
systemctl restart mysql

echo "MYSQL SETUP COMPLETED"

