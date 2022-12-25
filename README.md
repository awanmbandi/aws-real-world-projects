# 👨🏼‍💻 Deploying a 3 Tier H.A Web Application on AWS 👨🏼‍💻
In this runbook, we will discuss/implement the a PHP app deployment with multi-tier architecture on AWS. We will be using the Amazon EC2 service on AWS for Linux server, Apache Web server and PHP. For the Mysql database, we will use the RDS service on AWS as a separate micro service and will be serving a seperate layer based on the architecture. We will connect the webserver to the app and the app with the database to achieve a multi-tier application architecture deployment. To engage this project, you need to have a registered AWS account and at this point, I assume that you already have one.

## Step 1: Create The Base Networking Infrastructure For NAT/ELB, Webservers, Appservers and Database
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

## Step 2: Create 2 Public Route Rable and 6 Private Route Tables (Because of NAT Redundancy Implementation)
### A) NAT/ALB Public Subnet Route Table
- Name: `Prod-NAT-ALB-Public-RT`
- VPC: Select the `Prod-VPC`

### B) Webserver Subnet Route Table
- Name: `Prod-Webserver-RT`
- VPC: Select the `Prod-VPC`

### C) Appserver Subnet Table Table
- Name: `Prod-Appserver-RT`
- VPC: Select the `Prod-VPC`

### D) Database Subnet Route Table
- Name: `Prod-Database-RT`
- VPC: Select the `Prod-VPC`

## Step 3: Associate All Above Route Tables With Their Respective Subnets
1. Associate `Prod-NAT-ALB-Public-RT` with `Prod-Webserver-Subnet-1` and `Prod-Webserver-Subnet-2`
2. Associate `Prod-Webserver-RT` with `Prod-Webserver-Subnet-1` and `Prod-Webserver-Subnet-2`
3. Associate `Prod-Appserver-RT` with `Prod-Appserver-Subnet-1` and `Prod-Appserver-Subnet-2`
4. Associate `Prod-Database-RT` with `Prod-db-Subnet-1` and `Prod-db-Subnet-2`

## Step 4: Create and Configure IGW and NAT Gateways 
### A) Create and Configure IGW to Expose The `NAT/ALB Subnet 1` and `NAT/ALB Subnet 2`
1. Create the Internet Gatway
- Name: `Prod-VPC-IGW`
- VPC: Select the `Prod-VPC` Network

2. Configure/Edit the `Prod-NAT-ALB-Public-RT` Route Table 
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

3. Configure/Edit the Route Tables of `Webserver subnet`, `Appserver subnet` and `database subnet` to Add the `Nat gateway` Config



