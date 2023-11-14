### Install Boto
pip3 install boto
pip3 install boto3

### Check Playbook Syntax
ansible-playbook appserver_instance.yaml --syntax-check

## Execute Playbook
ansible-playbook appserver_instance.yaml -vvvv