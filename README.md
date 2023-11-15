## Ansible Tower Workflow Template Project

## 1) Create And Setup Your Ansible Tower Environment
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
* **NOTE: 2** *This IP will also be used by Tower to Configure and Deploy the Web Application*
![CreateElasticIP](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.23.41%20AM.png)
![CreateElasticIP](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.29.51%20AM.png)

- Confirm that you were assigned an Elastic IP Address
![VerifyElasticIP](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%2011.37.36%20AM.png)

## 2) Create Ansible Tower Project Resources
### A) Create An Inventory
- Navigate back to `Tower`, http:ANSIBLE_TOWER_IP
![CreateProjectInventory](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%206.48.56%20PM.png)
![Inventory](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%206.56.55%20PM.png)
![Inventory](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.05.00%20PM.png)
![Inventory](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.07.34%20PM.png)
![InvResult](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.12.25%20PM.png)

### B) Create A Project
- Click on `Projects`
![CreateProject](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.15.14%20PM.png)
![CreateProject](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.24.13%20PM.png)
![CreateProject](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.27.02%20PM.png)

### C) Generate API Keys (Access and Secret Keys) For Your AWS Environment
- Identify a User with `EC2` and `RDS` Access or `AdministratorAccess` 
- You can as well Create a New user if you do not have one and assign the required access
- Generate `Access` and `Secret` Keys for we'll need this to Authorize Ansible Tower 

### B) Create Credentials For Your AWS Environment and Appserver
### B.1) Create AWS Credentials
- Click on `Credentials`
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.31.05%20PM.png)
- Provide all relevant values
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.43.37%20PM.png)

### B.2) Create AWS Credentials
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.52.34%20PM.png)
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%207.57.39%20PM.png)
![CreateCredential](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202023-11-14%20at%208.04.13%20PM.png)

### A) Create Your Tower Project Inventory


