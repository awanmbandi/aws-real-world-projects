## Step 1: Make sure to execute the `web-automation.sh` script to install `Apache2`
- Also confirm that the service is started and you can access from the browser
![Apache2WebPage!](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202022-12-24%20at%202.15.12%20AM.png)

## Step 2: Configure and Setup The `Apache2 Reverse Proxy` to Point at The `Internal Load Balancer`
### NOTE: Before Applying any change on the below `sites-available` config files, I'll advice you take a Backup for Recovery purpose 
ls /etc/apache2
ls /etc/apache2/sites-enabled

sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo wget 

