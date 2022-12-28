## STEP 1
- Region `California`
- Create Prod VPC `USE The CREAT WIZARD` 
    - Define: Resources to create `VPC and More`
    - Define: Name tag auto-generation: `Uncheck` and Give Names
    - Define `Number of Availability Zones (AZs)`
    - Define `Number of public subnets`
    - Define `Number of private subnets`
    - Define `NAT gateways ($)`
    - Define `Names`
    - Define `IPv4 CIDR block`
    - Define `VPC Endpoint`(OPTIONAL)
    - DNS options: Make sure `Enable DNS resolution` is `Enabled`

- Create `4` Public Subnets and `4` Private Subnets
- Route Tables: Create 
    - 2 Route Tables for `FrontEnd ALB`/`NAT Gateways` Subnets (1 Per Subnet)
    - 1 Route Table for `Webservers` Subnet
    - 2 Route Tables for `Appservers` Subnet
    - 2 Route Tables for `Database` Subnet

- Associate All Route Tables With Respective Subnets

- Create `1 Internet gateway` and `2 NAT Gateways`

- Configure/Edit All Subnet Route Tables to Add Relevant Routes

## STEP 2
- Create (For Now Open `HTTP` to `0.0.0.0/0`)
    - `Bastion` Security Group
    - `Frontend Load Balancer` Security Group
    - `Webservers` Security Group
    - `Backend Load Balancer` Security Group
    - `Appservers` Security Group
    - `Database` Security Group

## STEP 3
- Create
    - `Bastion` (Ubuntu) EC2 Instance
    - `Databse` (MySQL) Instance
    - `Appserver` (Ubuntu) EC2 Instance
    - `Backend Load Balancer` (ALB) Resource
    - `Webserver` (Configure) (Amazon Linux 2) EC2 Instance
    - `Frontend Load Balancer` (ALB) Resource
    - NOTE: `Route 53` can come in later

