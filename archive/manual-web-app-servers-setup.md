## STEP 9.1 (NOTE): 
- We're going to create a single ``WEBSERVER`` and ``APPSERVER`` to test the app deployment. 
- Once we test and confirm that everything is working fine and the application is accessible, we're going create Golden AMIs from the APP and WEB server Infra
- Once we have the Golden AMIs, we'll use that to implement H.A with Autoscaling

### STEP 9.2: Create Appserver Instance
- Navigate to Instance in EC2
- Click on `Launch Instance`
    - Name: `Prod-Appserver`
    - AMI: `Amazon Linux 2`
    - Instance type: `t2.micro`
    - Key pair name: `Select the same Key pair` as your `Bastion-Host` since we're using SSH Portfwarding
        - Name: `Prod-"YOUR_REGION"-Key`
    - Network:
        - VPC: `Prod-VPC`
        - Subnet: Select either `Prod-Appserver-Subnet-1` or `Prod-Appserver-Subnet-2`
        - Auto-assign public IP: `Disable`
        - Security Group: 
            - Select existing security group: `Appservers-Security-Group`
        - Click on Advance Configurations:
            - IAM Instance Profile: `EC2-AmazonS3ReadOnlyAccess`
            - User Script: 
                - Go to: https://github.com/awanmbandi/aws-real-world-projects/blob/four-tier-mailing-app-project/appservers-startup-scripts/app-automation.sh
                - Update: Update the `S3 Bucket/Object URI`
                - Update: Update the `S3 Bucket/Object URI`
            - Userdata: `Pass your updated userdata script to the Appserver EC2` https://github.com/awanmbandi/aws-real-world-projects/blob/four-tier-mailing-app-project/appservers-startup-scripts/app-automation.sh
            - User Script: Pass the userdata once you are done editing your s3 bucket/object URI
    - Click `LAUNCH INSTANCE`

### STEP 9.2: Create Webserver Instance
- Update Userdata Script: https://github.com/awanmbandi/aws-real-world-projects/blob/four-tier-mailing-app-project/webservers-reverse-proxy-config/web-automation.sh
    - Download or Create the file locally: `Update the S3 Bucket Object URI` of `000-default.conf` to yours
- Navigate to Instance in EC2
- Click on `Launch Instance`
    - Name: `Prod-Webserver`
    - AMI: `Ubuntu 20.04`
    - Instance type: `t2.micro`
    - Key pair name: `Select the same Key pair` as your `Bastion-Host` since we're using SSH Portfwarding
        - Name: `Prod-"YOUR_REGION"-Key`
    - Network:
        - VPC: `Prod-VPC`
        - Subnet: Select either `Prod-Webserver-Subnet-1` or `Prod-Webserver-Subnet-2`
        - Auto-assign public IP: `Enable`
        - Security Group: 
            - Select existing security group: `Webservers-Security-Group`
        - Click on Advance Configurations:
            - IAM Instance Profile: `EC2-AmazonS3ReadOnlyAccess`
            - User Script: `Pass your updated user script` https://github.com/awanmbandi/aws-real-world-projects/blob/four-tier-mailing-app-project/webservers-reverse-proxy-config/web-automation.sh
            - User Script: Pass the userdata once you are done editing your s3 bucket/object URI
    - Click `LAUNCH INSTANCE`

#### 2. Configure Your Appserver Environment
- Use the following Runbook: https://github.com/awanmbandi/aws-real-world-projects/blob/four-tier-mailing-app-project/appservers-startup-script/app-automation.sh
- Once You're Done Configuring the Appserver Environment, Go Ahead and `Integrate App and Web with LoadBalancers`

#### 3. Integrate the `Webserver and Appserver` Instance With Your `Frontend and Backend Load Balancer`
##### REGISTER FRONTEND TARGET GROUP
- Click on EC2, Click on `Target Groups`
    - Click on `Frontend-LB-HTTP-TG`
    - Click on `Registered Targets`
        - Select the `Prod-Webserver`
        - Click `Inlcude as pending below`
        - Click `Register pending targets`

##### REGISTER FRONTEND TARGET GROUP
- Click on EC2, Click on `Target Groups`
    - Click on `Backend-LB-HTTP-TG`
    - Click on `Registered Targets`
        - Select the `Prod-Appserver`
        - Click `Inlcude as pending below`
        - Click `Register pending targets`

##### AFTER REGISTERING APP and WEB with LOAD BALANCERS 
1. Go ahead and Test the Solution
2. NOTE: You might need to give it some time to Provision

===========================================================

## PART 2: EXTEND YOUR SOLUTION WITH HIGH AVAILABILITY WITH AUTO SCALING
## STEP 10: Create Webserver and Appserver Golden AMIs
### 10.1: Create Webserver Golden AMI
- Navigate to the EC2 Console
- Select your `Prod-Webserver` instance
- Click on `Actions` >> Select `Image and Template`
    - Click `Create Image`
        - Name: `PHP-Webserver-Golden-AMI`
        - Description: `PHP-Webserver-Golden-AMI`
    - Click on `CREATE`

### 10.2: Create Appserver Golden AMI
- Navigate to the EC2 Console
- Select your `Prod-Appserver` instance
- Click on `Actions` >> Select `Image and Template`
    - Click `Create Image`
        - Name: `PHP-Appserver-Golden-AMI`
        - Description: `PHP-Appserver-Golden-AMI`
    - Click on `CREATE`

### 10.3: Verify AMI Creation
- Still on the EC2 Console
- Navigate to `Images`
- Click on `AMIs`
    - Update Webserver AMI name: `PHP-Webserver-Golden-AMI`
    - Update Appserver AMI name: `PHP-Appserver-Golden-AMI`
    - Verify Status: `Available`