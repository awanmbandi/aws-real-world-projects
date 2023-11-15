# Install and Configure Ansible Tower
sudo subscription-manager register --username mbandi_jjtech_towerbatch --password JJTechIncTower@2023
sudo dnf clean all
sudo dnf remove NetworkManager-cloud-setup NetworkManager-cloud-setup-1:1.40.0-5.el8_7 authselect-compat authselect-compat-1.2.5-2.el8_7 -y
sudo dnf update NetworkManager NetworkManager-libnm authselect authselect-libs -y
sudo dnf update --allowerasing -y
sudo dnf install ansible --allowerasing -y
sudo dnf remove ansible-core ansible --allowerasing -y
sudo dnf install ansible -y
sudo dnf install vim curl -y 
mkdir /tmp/tower && cd  /tmp/tower
curl -k -O https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
tar xvf ansible-tower-setup-latest.tar.gz
cd ansible-tower-setup*/
sed -i "s/admin_password=''/admin_password='admin'/g" inventory
sed -i "s/pg_password=''/pg_password='admin'/g" inventory
sudo ./setup.sh

