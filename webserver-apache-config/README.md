## Step 1: Make sure to execute the `web-automation.sh` script to install `Apache2`
- Also confirm that the service is started and you can access from the browser
![Apache2WebPage!](https://github.com/awanmbandi/aws-real-world-projects/blob/project-resources-docs/images/Screen%20Shot%202022-12-24%20at%202.15.12%20AM.png)

## Step 2: Configure and Setup The `Apache2 Reverse Proxy` to Point at The `Internal Load Balancer`
### NOTE: 
- Before Applying any change on the below `sites-available` config files, I'll advice you take a Backup for Recovery purpose 
- Before running the below commands make sure to `EDIT` the `Load Balancer DNS` in the `Reverse Proxy File` `000-default.conf` with your `LoadBalancer DNS` 
- You can as well create the `000-default.conf` directly in the `Web Server` using any text editor like `VI` than downloading.
```
ls /etc/apache2
```
```
ls /etc/apache2/sites-enabled
```
```
sudo rm /etc/apache2/sites-enabled/000-default.conf
```
```
sudo wget https://raw.githubusercontent.com/awanmbandi/aws-real-world-projects/main/webserver-apache-config/000-default.conf -P /etc/apache2/sites-enabled
```


