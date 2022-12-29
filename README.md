# 👨🏼‍💻 Deploying a 4 Tier Mailing Web Application on AWS 👨🏼‍💻
## NOTE (ANNOUNCEMENT) DEC 29th:
- I recently updated the branch name `three-tier-mailing-app-project` where the project scripts are in to `four-tier-mailing-app-project` 
- You do not have to border about changing anything on your end because the project runbooks/scripts are all still the same, I only update the branch name to match the architecture we're building for this Application.
- To make things esier for everyone, I have `MADE` the `four-tier-mailing-app-project` BRANCH the `DEFAULT` BRANCH. So you don't have to switch to the project branch everytime you click on the base repo link. 

## 
In this runbook, we will implement the PHP Mailing deployment with multi-tier architecture on AWS. We will be using the Amazon EC2 service on AWS for Webservers and Appservers. For the Mysql database, we will use the RDS service. We'll also see how to connect the Webserver to the Appservers and the Appservers with the Database to achieve a multi-tier application architecture deployment.

## STEP 1: Create The Base Networking Infrastructure For NAT/ELB, Webservers, Appservers and Database
### A) Create The VPC Network
- Name: `Prod-VPC`
- CidirBlock: `10.0.0.0/16`

### B) Create The NAT/AL Subnet 1 and 2
1. NAT/ALB Subnet 1
- Name: `Prod-NAT-ALB-Subnet-1`
- CidirBlock: `10.0.5.0`
- Availability Zone: `us-west-1a`

2. NAT/ALB Subnet 2
- Name: `Prod-NAT-ALB-Subnet-2`
- CidirBlock: `10.0.10.0`
- Availability Zone: `us-west-1c`

### B) Create The Webserver Subnet 1 and 2
1. Webserver Subnet 1
- Name: `Prod-Webserver-Subnet-1`
- CidirBlock: `10.0.15.0`
- Availability Zone: `us-west-1a`

2. Webserver Subnet 2
- Name: `Prod-Webserver-Subnet-2`
- CidirBlock: `10.0.20.0`
- Availability Zone: `us-west-1c`

### C) Create The Appserver Subnet 1 and 2
1. Appserver Subnet 1
- Name: `Prod-Appserver-Subnet-1`
- CidirBlock: `10.0.25.0`
- Availability Zone: `us-west-1a`

2. Appserver Subnet 2
- Name: `Prod-Appserver-Subnet-2`
- CidirBlock: `10.0.30.0`
- Availability Zone: `us-west-1c`

### D) Create The Database Subnet 1 and 2
1. Database Subnet 1
- Name: `Prod-db-Subnet-1`
- CidirBlock: `10.0.35.0`
- Availability Zone: `us-west-1a`

2. Database Subnet 2
- Name: `Prod-db-Subnet-2`
- CidirBlock: `10.0.40.0`
- Availability Zone: `us-west-1c`

## STEP 2: Create 4 Public Route Rable and 4 Private Route Tables (Because of NAT Redundancy Implementation)
- See AWS Doc: https://www.shorturl.at/HSU18

### A) NAT/ALB Public Subnet 1 Route Table
- Name: `Prod-NAT-ALB-Public-RT-1`
- VPC: Select the `Prod-VPC`

### B) NAT/ALB Public Subnet 2 Route Table
- Name: `Prod-NAT-ALB-Public-RT-2`
- VPC: Select the `Prod-VPC`

### C) Webserver Subnet 1 Route Table
- Name: `Prod-Webserver-RT-1`
- VPC: Select the `Prod-VPC`

### D) Webserver Subnet 2 Route Table
- Name: `Prod-Webserver-RT-2`
- VPC: Select the `Prod-VPC`

### E) Appserver Subnet 1 Table Table
- Name: `Prod-Appserver-RT-1`
- VPC: Select the `Prod-VPC`

### F) Appserver Subnet 2 Table Table
- Name: `Prod-Appserver-RT-2`
- VPC: Select the `Prod-VPC`

### G) Database Subnet 1 Route Table
- Name: `Prod-Database-RT-1`
- VPC: Select the `Prod-VPC`

### H) Database Subnet 2 Route Table
- Name: `Prod-Database-RT-2`
- VPC: Select the `Prod-VPC`

## STEP 3: Associate All Above Route Tables With Their Respective Subnets
1. Associate `Prod-NAT-ALB-Public-RT-1` with `Prod-NAT-ALB-Subnet-1` 
2. Associate `Prod-NAT-ALB-Public-RT-2` with `Prod-NAT-ALB-Subnet-2`
3. Associate `Prod-Webserver-RT-1` with `Prod-Webserver-Subnet-1` 
4. Associate `Prod-Webserver-RT-2` with `Prod-Webserver-Subnet-2`
5. Associate `Prod-Appserver-RT-1` with `Prod-Appserver-Subnet-1` 
6. Associate `Prod-Appserver-RT-2` with  `Prod-Appserver-Subnet-2`
7. Associate `Prod-Database-RT-1` with `Prod-db-Subnet-1` 
8. Associate `Prod-Database-RT-2` with `Prod-db-Subnet-2`

## STEP 4: Create and Configure IGW and NAT Gateways 
### A) Create and Configure IGW to Expose The `NAT/ALB Subnet 1` and `NAT/ALB Subnet 2`
1. Create the Internet Gatway
- Name: `Prod-VPC-IGW`
- VPC: Select the `Prod-VPC` Network

2. Configure/Edit the `Prod-NAT-ALB-Public-RT-1` Route Table 
- Destination: `0.0.0.0/0`
- Target: Select the `Prod-VPC-IGW`
- `SAVE`

3. Configure/Edit the `Prod-NAT-ALB-Public-RT-2` Route Table 
- Destination: `0.0.0.0/0`
- Target: Select the `Prod-VPC-IGW`
- `SAVE`

4. Configure/Edit the `Prod-Webserver-RT-1` Route Table 
- Destination: `0.0.0.0/0`
- Target: Select the `Prod-VPC-IGW`
- `SAVE`

5. Configure/Edit the `Prod-Webserver-RT-2` Route Table 
- Destination: `0.0.0.0/0`
- Target: Select the `Prod-VPC-IGW`
- `SAVE`

### B) Create and Configure The NAT Gateways to point at the Web, App and Database Tiers/Subnets
1. Create the `First NAT Gateway`
- Name: `Prod-NAT-Gateway-1`
- Elastic IP: Clcik `Allocate Elastic IP`
- Click `Create NAT gateway`

2. Create the `Second NAT Gateway`
- Name: `Prod-NAT-Gateway-2`
- Elastic IP: Clcik `Allocate Elastic IP`
- Click `Create NAT gateway`

### C) Configure/Edit the Route Tables of `Appserver subnets` and `Database subnets` to Add the `Nat gateway` Configs

### C.1) Update the `Appserver subnet` Route tables (2) with the following configs

1. Select the `Prod-Appserver-RT-1`
- Click on Edit and `Add route`
- Destination: `0.0.0.0/0`
- Target: Select `Prod-NAT-Gateway-1`

2. Select the `Prod-Appserver-RT-2`
- Click on Edit and `Add route`
- Destination: `0.0.0.0/0`
- Target: Select `Prod-NAT-Gateway-2`

### C.2) Update the `Database subnet` Route tables (2) with the following configs

1. Select the `Prod-Database-RT-1`
- Click on Edit and `Add route`
- Destination: `0.0.0.0/0`
- Target: Select `Prod-NAT-Gateway-1`

2. Select the `Prod-Database-RT-2`
- Click on Edit and `Add route`
- Destination: `0.0.0.0/0`
- Target: Select `Prod-NAT-Gateway-2`

## STEP 5: Create Security Groups
### Create the Bastion Host Security Group
- Click on Create Security group
    - Name: `Bastion-Host-Security-Group`
    - Inbound: 
        - Ports: `22`
        - Source: Provide `Your IP or 0.0.0.0/0`

### Create the Frontend/External Load Balancer Security Group
- Navigate to `Security groups`
- Click on Create Security group
    - Name: `Frontend-LB-Security-Group`
    - Inbound: 
        - Ports: `80 and 443`
        - Source: `0.0.0.0/0`

    - Click `Create Security Group`

### Create the Webservers Security Group
- Click on Create Security group
    - Name: `Webservers-Security-Group`
    - Inbound: 
        - Ports: `80 and 443`
            - Source: Provide the `Frontend-LB-Security-Group` ID
        - Ports: `22`
            - Source: `Bastion-Host-Security-Group` ID

### Create the Backend Load Balancer Security Group
- Click on Create Security group
    - Name: `Backend-LB-Security-Group`
    - Inbound: 
        - Ports: `80 and 443`
        - Source: Provide the `Webservers-Security-Group` ID

### Create the Appservers Security Group
- Click on Create Security group
    - Name: `Appservers-Security-Group`
    - Inbound: 
        - Ports: `80 and 443`
            - Source: Provide the `Backend-LB-Security-Group` ID
        - Ports: `22`
            - Source: `Bastion-Host-Security-Group` ID

### Create the Database Security Group
- Click on Create Security group
    - Name: `Database-Security-Group`
    - Inbound: 
        - Ports: `3306`
            - Source: Provide the `Appservers-Security-Group` ID
        - Ports: `3306`
            - Source: `Bastion-Host-Security-Group` ID

## STEP 6: Create Frontend and Backend Load Balancers
### Create Frontend Load Balancer
- Navigate to `EC2/Load Balancers` and Click on `Create Load Balancer`
    - Type: Choose `Application Load Balancer`
    - Load balancer name: `Prod-Frontend-LB`
    - Scheme: `Internet-facing`
    -  IP address type: `IPv4`
    - Network mapping:
        - VPC: Select `Prod-VPC`
        - Mappings: Select the `Prod-NAT-ALB-Subnet-1` and `Prod-NAT-ALB-Subnet-2` frontend subnets
    - Security groups: Select the `Frontend-LB-Security-Group`
    - Listeners and routing: 
        - Click on `Create a target group` to create `HTTP` target group
            - target type: select `instances`
            - Target group name: `Frontend-LB-HTTP-TG`
            - Protocol and Port: `HTTP`:`80`
            - VPC: Select `Prod-VPC`
            - Protocol version: `HTTP1`
            - Health checks: `HTTP`
            - Health check path: `/VenturaMailingApp.php`
            - Click on `Next`
            - Click on `Create target group`

    - `NOTE:` Navigate back to the page where you're creating the `LoadBalancer` and Refresh (Not The Whole Page)
    - Listeners and routing: 
        - Protocol: `HTTP`
        - Listener `HTTP:80`
        - Select the `Frontend-LB-HTTP-TG`
    
    - Click on `Create load balancer`

### Create Backend Load Balancer
- Navigate to `EC2/Load Balancers` and Click on `Create Load Balancer`
    - Type: Choose `Application Load Balancer`
    - Load balancer name: `Prod-Backend-LB`
    - Scheme: `Internet-facing`
    -  IP address type: `IPv4`
    - Network mapping:
        - VPC: Select `Prod-VPC`
        - Mappings: Select the `Prod-Webserver-Subnet-1` and `Prod-Webserver-Subnet-2` Webserver/Provate subnets
    - Security groups: Select the `Backend-LB-Security-Group`
    - Listeners and routing: 
        - Click on `Create a target group` to create `HTTP` target group
            - target type: select `instances`
            - Target group name: `Backend-LB-HTTP-TG`
            - Protocol and Port: `HTTP`:`80`
            - VPC: Select `Prod-VPC`
            - Protocol version: `HTTP1`
            - Health checks: `HTTP`
            - Health check path: `/VenturaMailingApp.php`
            - Click on `Next`
            - Click on `Create target group`

    - `NOTE:` Navigate back to the page where you're creating the `LoadBalancer` and Refresh (Not The Whole Page)
    - Listeners and routing: 
        - Protocol: `HTTP`
        - Listener `HTTP:80`
        - Select the `Backend-LB-HTTP-TG`
    
    - Click on `Create load balancer`

## STEP 7: Create an S3 Bucket Environment To Upload The Automation and Database Configs
- Navigate to `Amazon S3`
- Click on `Create Bucket`
    - Name: Use naming convention `prod-proxy-app-db-config-YOUR-LAST-NAME-and-DAY-OF-BIRTH`
    - AWS Region: Select your project region `(California) us-west-1`
    - Object Ownership: `ACLs disabled`
    - Block Public Access settings for this bucket: `Enable` `Block all public access`
    - Bucket Versioning: `Enable`
    - Default encryption: `Enable`
    - Click `CREATE BUCKET`

## STEP 8: Create a Bastion Host VM For Remote Access ((SSH)) To Webservers, Appservers and MySQL Database
- Navigate to Instance in EC2
- Click on `Create Instance`
    - Name: `Prod-Bastion-Host`
    - AMI: `Ubuntu 18.04`
    - Instance type: `t2.micro`
    - Key pair name: Select/Create Key pair
        - Name: `Prod-"YOUR_REGION"-Key`
    - Network:
        - VPC: `Prod-VPC`
        - Subnet: Select either `Prod-NAT-ALB-Subnet-1` or `Prod-NAT-ALB-Subnet-2`
        - Security Group: Select the `Bastion-Host-Security-Group`
    - Click `LAUNCH INSTANCE`

### Setup SSH Port Forwarding Between Your Local and Bastion Host To Point at The Web, App and DB Instance.
```exec ssh-agent bash``` 

```eval 'ssh-agent -s'```

```ssh-agent bash```

#### ssh-add -L    
- (Once you run this command it will tell you if you have added some identities to SSH agen or not. If not run the bellow command to add identity or private key) 
```ssh-add -k "Absolute Path to your Private key file on your Local"```

```ssh-add -L```
Now run the above command to check added identities or Private keys 

- Now we have to use this SSH Agent Identity to login to our bastion in the public subnet then we'll be able to login to our private server 

#### ssh -A -i "private key" USER_NAME@HostNameORipAddress
```ssh -A -i "private key" USER_NAME@HostNameORipAddress```
- (-A stands for AGENT FORWARDING. And once you get into the instance in the Bastion host using the SSH AGENT Identity, when you try to SSH into the instance in the private subnet now, what SSH AGENT will do is. It will make use of the Identity in your local machine to access the server. Then you'll be authenticated) 

#### ssh USER_NAME@IPAddress
```ssh USER_NAME@"Private Instance IP Address"```
- (Once you run this command you will be allowed into the server. That is SSH Agent port fording. It makes use of the locally stored Identity). 

### Create an AmazonS3ReadOnlyAccess For Your Web and App Servers
- Navigate to IAM
- Click on Roles and `Create Role`
    - Select `EC2` 
    - Click on `Next`
    - Permissions policies: Assign `AmazonS3ReadOnlyAccess`
    - Click on `Next` 
    - Name: `EC2-AmazonS3ReadOnlyAccess`
    - Click `CREATE`

## STEP 9: Create Webservers and Apservers Launch Templates
### Create Webserver Launch Template
- Naviagte to EC2/Launch Configuration
    - Click on `Create Launch Configuration`
    - Switch by Clicking on `Create launch template`
        - Name: `Prod-Webservers-LT`
        - Template version description: `Prod-Webservers-LT Version 1`
        - AMI: Select for `Ubuntu 18.04`
        - Instance type: `t2.micro`
        - Key pair: Create a new key pair `california-keypair`
        - Network Settings:
            - Subnet: Select one of the Webserver subnets
            - Security groups (Firewalls): Select the `Webservers-Security-Group`
        
        - Expand `Advance details`
            - IAM instance profile: Select `S3-AmazonS3ReadOnlyAccess` IAM Role
            - `NOTE:` Make sure to update the LoadBalancer DNS `BACKEND_LOAD_BALANCER_DNS` in https://github.com/awanmbandi/aws-real-world-projects/blob/three-tier-mailing-app-project/webserver-reverse-proxy-config/000-default.conf `before passing the below User Data`
            - User data: provide the user data in https://github.com/awanmbandi/aws-real-world-projects/blob/three-tier-mailing-app-project/webserver-reverse-proxy-config/web-automation.sh
            - `NOTE:` Update the `webserver-reverse-proxy-config/000-default.conf` on GitHub before passing User Data

            - Click on `Create launch template`

### Create Appserver Launch Template
- Naviagte to EC2/Launch Configuration
    - Click on `Create Launch Configuration`
    - Switch by Clicking on `Create launch template`
        - Name: `Prod-Appservers-LT`
        - Template version description: `Prod-Appservers-LT Version 1`
        - AMI: Select for `Amazon Linux 2`
        - Instance type: `t2.micro`
        - Key pair: Create a new key pair `california-keypair`
        - Network Settings:
            - Subnet: Select one of the Appserver subnets
            - Security groups (Firewalls): Select the `Appservers-Security-Group`
        
        - Expand `Advance details`
            - IAM instance profile: Select `S3-AmazonS3ReadOnlyAccess` IAM Role
            - `NOTE:` Make sure to update the Database Configurations in https://github.com/awanmbandi/aws-real-world-projects/blob/main/appserver-database-config/wp-config.php with Yours, `before passing the below User Data`
            - User data: provide the user data in https://github.com/awanmbandi/aws-real-world-projects/blob/main/appserver-startup-script/app-automation.sh
            - `NOTE:` Update the Database Configuration file `main/appserver-database-config/wp-config.php` on GitHub before passing the User Data
            - Once changes have been made and user data passed 
            - Click on `Create launch template`

## STEP 10: Create Webserver and Appserver Auto Scaling Groups
### A). Webserver Autocsaling Group
- Navigate to `EC2/Auto Scaling`
    - Click on `Create Auto Scaling Group`
        - Auto Scaling group name: `prod-webservers-autoscaling-group`
        - Launch template: Select the `Prod-Webservers-LT`
        - Click on `NEXT`
        - VPC: Select `Prod-VPC`
        - Availability Zones and subnets: Select `Prod-Webserver-Subnet-1` and `Prod-Webserver-Subnet-2`
        - Click `NEXT`
        - Load balancing: Select "Attach to an existing load balancer", select `Frontend-LB-HTTP-TG`
            - Select `Choose from your load balancer target groups`
            - Existing load balancer target groups: Select the `Frontend-LB-HTTP-TG`

        - Health check type: Select `EC2` and `ELB`
        - Click on `NEXT`
        
        - Group size: 
            - Desired: `2`
            - Min: `2`
            - Max: `5`
        
        - Scaling policies: 
            - NOTE: Also Known as Dynamic Scaling. This defines the `Scale Out Policy/Action`
            - Select `Target tracking scaling policy`
                - Scaling policy name: `prod-asg-scale-out-policy`
                - Metric type: Select `Average VPU Utilization`
                - Target value: `80%`
            - Click on `NEXT`
            - Click on `NEXT`
            - Click on `NEXT`
            - Click on `Create Auto Scaling Group`

### B). Appserver Autocsaling Group
- Navigate to `EC2/Auto Scaling`
    - Click on `Create Auto Scaling Group`
        - Auto Scaling group name: `prod-appservers-autoscaling-group`
        - Launch template: Select the `Prod-Appserver-LT`
        - Click on `NEXT`
        - VPC: Select `Prod-VPC`
        - Availability Zones and subnets: Select `Prod-Appserver-Subnet-1` and `Prod-Appserver-Subnet-2`
        - Click `NEXT`
        - Load balancing: Select "Attach to an existing load balancer", select `Backend-LB-HTTP-TG`
            - Select `Choose from your load balancer target groups`
            - Existing load balancer target groups: Select the `Backend-LB-HTTP-TG`

        - Health check type: Select `EC2` and `ELB`
        - Click on `NEXT`
        
        - Group size: 
            - Desired: `2`
            - Min: `2`
            - Max: `5`
        
        - Scaling policies: 
            - NOTE: Also Known as Dynamic Scaling. This defines the `Scale Out Policy/Action`
            - Select `Target tracking scaling policy`
                - Scaling policy name: `prod-asg-scale-out-policy`
                - Metric type: Select `Average VPU Utilization`
                - Target value: `80%`
            - Click on `NEXT`
            - Click on `NEXT`
            - Click on `NEXT`
            - Click on `Create Auto Scaling Group`

## STEP 11: Create a Database Subnet Group and Database Instance (RDS)
### A) Create Databse Subnet Group
- Navigate to the `RDS` Service
- Click on `Subnet groups`
    - Click `Create DB Subnet Group`
    - Name: `prod-db-subnet-group`
    - VPC: Select `Prod-VPC`
    - Availability Zones: Select the two zones you used for this project. Example `us-west-1a` and `us-west-1c`
    - Subnets: Select `Prod-db-Subnet-1` and `Prod-db-Subnet-2`
    - Click on `CREATE`

### B) Create a Database Instance
- Navigate to the `RDS` Service
- Click on `Databases` and `Create Database`
    - Choose a database creation method: Select `Standard create`
    - Engine type: `MySQL`
    - Engine Version: Select the `latest`
    - Templates: `Production`
    - Deployment options: `Multi-AZ DB instance`

    - Databse Settings:
        - DB instance identifier: `prod-database`
        - Master username: `admin`
        - Master password: For example `admin2022`
        - NOTE: Password must be at least 8 characters, Can't contain / , ', " and @
        - DB instance class: Choose `Burstable classes`
            - Select `db.t3.micro`

    - Storage:
        - Storage type: Select `General Purpose SSD (gp3)`
        - Allocated storage: `30`
        - Storage autoscaling: `Enable`
        - Maximum storage threshold: Default `1000`
    
    - Connectivity:
        - Compute resource: Select `Don’t connect to an EC2 compute resource`
        - Virtual private cloud (VPC): `Prod-VPC`
        - DB Subnet group: Select your DB Subnet group `prod-db-subnet-group`
        - Public access: `NO`
            - NOTE: To remote Programatically manually, we'll have to setup a `bastion host`
        - Database authentication: Select `Password authentication`
    - Monitoring:
        - Enhanced Monitoring: `Disable`

    - Additional configuration: 
        - Initial database name: `proddatabase`
        - Backup: `Enable automated backups`
        - Encryption: `Enable encryption`
        - Maintenance: `Disable`
        - Deletion protection: `Disable`
    - Click `CREATE DATABASE`

## STEP 12: Create a Route 53 Hosted Zone and Record For The Frontend Load Balancer Endpoint







