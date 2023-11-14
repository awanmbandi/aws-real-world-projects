sudo yum -y update
sudo yum -y install epel-release
sudo yum -y install ansible vim curl
mkdir /tmp/tower && cd  /tmp/tower
curl -k -O https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
tar xvf ansible-tower-setup-latest.tar.gz
cd ansible-tower-setup*/
vim inventory
sudo ./setup.sh

