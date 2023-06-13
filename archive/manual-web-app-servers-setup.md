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