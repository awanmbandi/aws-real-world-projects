## Ansible Tower Workflow Template Project Arch
![TowerWorkflowProjectArch](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/ansible_tower_automation_architecture_v5.png)

### 1) Create And Setup Your Ansible Tower Environment
- Ansible Tower Installation and Setup Runbook: https://scribehow.com/shared/Ansible_Tower_Setup_and_Configuration_Runbook_V2__uHuL7Z7eQCySip-xiK7ySA 

### B) Once You're Done Setting Up Tower and Login, The Dashboard Should Look Like This
![AnsibleTowerDashboard](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.43.19%20AM.png)

## 2) Create a GitHub Project Repository
Once you setup your Ansible Tower environment. Follow below instructions to create a GitHub Project  Repository which we’ll need to keep the automation playbooks/scripts.
- Navigate to GitaHub, Click on `Repositories` and Clcik `New` to create a Repository
![GitHubRepo](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.56.09%20AM.png)

- Click on New and Create your Project Repository
![GitHubRepo](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2012.02.22%20PM.png)
![YourGitHubRepo](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2012.07.48%20PM.png)

### B) Clone The Repository Locally, Download The Project Playbooks and Push to GitHub
- Create a Folder in `Documents` called `Repositories` if you do not have one already where you git all your Git Repositories
![YourGitHubRepo](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2012.17.05%20PM.png)

- Clone Your Project Repository to the `Repositories` folder you just created
- Copy the `HTTPS Clone URL` and Run the command `git clone REPO_HTTPS_CLONE_URL`
![YourGitHubRepo](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2012.34.12%20PM.png)

- Download the Project `ZIP` From the Following Repository: https://github.com/awanmbandi/aws-real-world-projects
    - Branch: `ansible-tower-workflow-project`
![DownloadGitHubProjectZip](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2012.27.05%20PM.png)

- Unzip and Move/Copy Everything to The Repository You Cloned
![YourGitHubRepo](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%201.09.34%20PM.png)

- Add the Changes, Commit and Push to GitHub
![CommitPushGitHub](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%201.23.02%20PM.png)
- Verify and Confirm that the Code is Available on GitHub
![VerifyCodeAvailabilityGitHub](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%201.26.05%20PM.png)

## Create An Elastic IP Address In Your Working Region
* **NOTE: 1** *This IP will be used by the application server that will be Orchestrated by the `appserver_instance.yaml` automation playbook*
* **NOTE: 2** *The IP will also be used by Tower to Configure and Deploy the Web Application*
  - Click on `Elastic IPs`
  - Click on `Allocate Elastic IP address`
  - Tag Key: `env`
  - Tag Value: `dev`
![CreateElasticIP](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.23.41%20AM.png)
![CreateElasticIP](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.29.51%20AM.png)

- Confirm that you were assigned an Elastic IP Address
![VerifyElasticIP](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.37.36%20AM.png)

## 2) Create Ansible Tower Project Resources
### A) Create An Inventory
- Navigate back to `Tower`, http:ANSIBLE_TOWER_IP
- Click on `Inventory`
    - Click on `Inventory`
    - Name: `Appserver-Host`
    - Organization: `Default`
    - Click on `SAVE`
![CreateProjectInventory](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%206.48.56%20PM.png)
![Inventory](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-15%20at%209.29.51%20AM.png)
- Click on `HOST`
    - Click on the `Plus(+)` to add an Inventory
    - Host Name: `APPSERVER_ELASTIC_IP`
    - Click on `SAVE`
![Inventory](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.05.00%20PM.png)
![Inventory](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.07.34%20PM.png)
![InvResult](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.12.25%20PM.png)

### B) Create A Project
- Click on `Projects`
- Click on the `Plus(+)` to Create a Project
    - Name: `tower-automation-workflow-project`
    - Organization: `Default`
    - SCM Type: Select `GIT`
    - SCM URL: Provide your `GitHub project URL`
    - SCM Updates Options: Select `Clean` and `Delete On Updates`
    - Click `SAVE`
![CreateProject](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.15.14%20PM.png)
![CreateProject](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.24.13%20PM.png)
![CreateProject](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.27.02%20PM.png)

### C) Generate API Keys (Access and Secret Keys) For Your AWS Environment
- Identify a User with `EC2` and `RDS` Access or `AdministratorAccess` 
- You can as well Create a New user if you do not have one and assign the required access
- Generate `Access` and `Secret` Keys for we'll need this to Authorize Ansible Tower 

### B) Create Credentials For Your AWS Environment and Appserver
### B.1) Create AWS Credential
- Click on `Credentials`
- Click on the `Plus(+)` to Create AWS Credential
    - Name: `aws-environment-credential`
    - Organization: Select `Default`
    - Credential Type: Select `Amazon Web Services`
    - Access Key: Provide your `Access Key`
    - Secret Key: Provide your `Secret Key`
    - Click on `SAVE`
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.31.05%20PM.png)
- Provide all relevant values
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.43.37%20PM.png)

### B.2) Create Appserver/Machine Credential
- Click on the `Plus(+)` to Create AWS Credential
    - Name: `appserver-machine-credential`
    - Description: `appserver-machine-credential`
    - Organization: Select `Default`
    - Credential Type: Select `Machine`
    - Username: `ansibletower`
    - Password: `ansibletower`
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.52.34%20PM.png)
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.57.39%20PM.png)
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.04.13%20PM.png)

### D) Create Your Tower Project Job Templates 
### D.1) Create The Database Job Template
- Navigate to `Templates`
- Click on the plus to create a `Job Template`
    - Name: `database-instance-job-template`
    - Inventory: `Appserver-Host`
    - Job Type: Select `RUN`
    - Project: Select `tower-automation-workflow-project`
    - Playbook: Select the `rds_db_instance.yaml`
    - Credentials: Select your AWS Credential `aws-environment-credential`
    - Verbosity: Select...
    - Click on `SAVE`
![JobTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.09.20%20PM.png)
![DatabaseJobTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.23.35%20PM.png)

### D.2) Create The Appserver Job Template
- Click on the plus to create a `Job Template`
    - Name: `appserver-instance-job-template`
    - Inventory: `Appserver-Host`
    - Job Type: Select `RUN`
    - Project: Select `tower-automation-workflow-project`
    - Playbook: Select the `appserver_instance.yaml`
    - Credentials: Select your AWS Credential `aws-environment-credential`
    - Verbosity: Select...
    - Click on `SAVE`
![JobTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.29.10%20PM.png)
![AppserverJobTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.31.47%20PM.png)

### D.3) Create The Job Template To Clone The Project Repository
- Click on the plus to create a `Job Template`
    - Name: `clone-project-repository-job-template`
    - Inventory: `Appserver-Host`
    - Job Type: Select `RUN`
    - Project: Select `tower-automation-workflow-project`
    - Playbook: Select the `clone_project_repo.yaml`
    - Credentials: Select your Machine Credential `appserver-machine-credential`
    - Verbosity: Select...
    - Click on `SAVE`
![CloneRepoJobTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.36.47%20PM.png)

### D.4) Create The Application Deployment Job Template
- Click on the plus to create a `Job Template`
    - Name: `application-deployment-job-template`
    - Inventory: `Appserver-Host`
    - Job Type: Select `RUN`
    - Project: Select `tower-automation-workflow-project`
    - Playbook: Select the `app_deployment_config.yaml`
    - Credentials: Select your Machine Credential `appserver-machine-credential`
    - Verbosity: Select...
    - Click on `SAVE`
![DeployAppTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.53.10%20PM.png)

### D.5) Create The Database Configuration and Integration Job Template
- Click on the plus to create a `Job Template`
    - Name: `configure-application-database-integration-job-template`
    - Inventory: `Appserver-Host`
    - Job Type: Select `RUN`
    - Project: Select `tower-automation-workflow-project`
    - Playbook: Select the `app_db_config.yaml`
    - Credentials: Select your Machine Credential `appserver-machine-credential`
    - Verbosity: Select...
    - Click on `SAVE`
![ConfigureDBJobTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.57.34%20PM.png)

### Confirm You Have The Following Job Templates Created
![AllJobTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.59.06%20PM.png)

## 3) Create Project Workflow Job
- Click on `Templates`
- Click on the plus to create a `Workflow Template`
    - Name: `complete-project-workflow-automation`
    - Default: Select `Default`
    - Inventory; Select `Appserver-Host`
    - Click on `SAVE`
![CreateWorkflowTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%209.13.33%20PM.png)
![CreateWorkflowTemplate](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%209.19.09%20PM.png)

### 3.1) Add A Project Sync Stage
- Click on `START`
- Click on the Drop Down on the Right hand and select `Project Sync`
- Select the `tower-automation-workflow-project` project
- `RUN` Select `Always`
- `CONVERENCE` Select `Any`
- Click on `SELECT`
![IntegrateJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%209.30.18%20PM.png)

### 3.2) Add The Database Provisioning Stage
- Click on `START`
- Click on the Drop Down on the Right hand and select `Template`
- Select the `database-instance-job-template` project
- `RUN` Select `Always`
- `CONVERENCE` Select `Any`
- Click on `SELECT`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%209.36.03%20PM.png)

### 3.3) Add The Application Server Provisioning Stage
- Click on `START`
- Click on the Drop Down on the Right hand and select `Template`
- Select the `application-deployment-job-template` project
- `RUN` Select `Always`
- `CONVERENCE` Select `Any`
- Click on `SELECT`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%209.40.22%20PM.png)

### 3.4) Add The Approval Stage
- Click on `START`
- Click on the Drop Down on the Right hand and select `Approval`
- Name: `Approve App Deployment`
- Timeout: `30 Minutes`
- Run: `On Success` 
- Coverage: `Any`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%209.47.13%20PM.png)

### 3.5) Add The Application Server Provisioning Stage
- Click on `START`
- Click on the Drop Down on the Right hand and select `Template`
- Select the `clone-project-repository-job-template` project
- `RUN` Select `Always`
- `COVERAGE` Select `Any`
- Click on `SELECT`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%209.51.02%20PM.png)

### 3.6) Add The Application Deployment Stage
- Click on `START`
- Click on the Drop Down on the Right hand and select `Template`
- Select the `application-deployment-job-template` project
- `RUN` Select `Always`
- `COVERAGE` Select `Any`
- Click on `SELECT`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%209.55.32%20PM.png)

### 3.7) Add The Application Deployment Stage
- Click on `START`
- Click on the Drop Down on the Right hand and select `Template`
- Select the `configure-application-database-integration-job-template` project
- `RUN` Select `Always`
- `COVERAGE` Select `Any`
- Click on `SELECT`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2010.02.03%20PM.png)

### 3.8) Add The Application Deployment Stage
- Click on `SAVE`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2010.03.23%20PM.png)

### 4) Start The Workflow Automation
- Click on `Templates`
- Click on `complete-project-workflow-automation`
- Click on `Start` or `Launch`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2010.40.03%20PM.png)

### 5) Approve Application Configurationa And Deployment
- Click on `Alerts` and `APPROVE`
- You also have the option to `DENY`
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.17.44%20PM.png)
![DatabaseJobs](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.23.48%20PM.png)

### 6) Confirm That Your Workflow Succeeded
![ConfirmWorkFlowSuccess](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.27.29%20PM.png)

### 7) Access The Web Application Deployed In The Appserver Environment
- Navigate to `EC2`
- Select the `WebAppServer`, Copy the `Public IP` address and Paste on the `Browser`
- **NOTE: 1** *Make sure you have port `80` open to the Internet* 
- **NOTE: 1** *Also make sure you have port `3306` open to your `VPC Network`=`172.31.0.0/16`*
![ConfirmWorkFlowSuccess](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.41.19%20PM.png)

- Copy the RDS Database Endpoint
![ConfirmWorkFlowSuccess](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.59.09%20PM.png)

- Login to the Application Server
- Edit the Database Configuration File and Provide Your Database Endpoint
- RUN: `sudo vi /var/www/wordpress/wp-config.php`
![ConfirmWorkFlowSuccess](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-15%20at%2012.02.52%20AM.png)

### 8) Once You're Done Making The Above Changes, Go Ahead And Test The Application Access Again
- Make sure it's now able to connect with the Database
![ConfirmWorkFlowSuccess](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-15%20at%2012.06.52%20AM.png)
