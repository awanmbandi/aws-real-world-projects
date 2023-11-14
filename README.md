### Install Boto
pip3 install boto
pip3 install boto3

### Check Playbook Syntax
ansible-playbook appserver_instance.yaml --syntax-check

## Execute Playbook
ansible-playbook appserver_instance.yaml -vvvv

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

## 2) Create Ansible Tower Project Resources


### A) Create Your Tower Project Inventory


