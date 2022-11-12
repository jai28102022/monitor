sudo apt update 
sudo apt install apache2 -y 
sudo a2enmod authz_groupfile auth_digest 
sudo systemctl restart apache2

# select 'No Configuration' for Postfix during installation 
sudo apt install nagios4 nagios-nrpe-plugin nagios-plugins-contrib -y   

sudo htdigest -c /etc/nagios4/htdigest.users Nagios4 nagiosadmin  
 
wget https://raw.githubusercontent.com/jai28102022/monitor/main/nagios/nagios4-cgi.conf
sudo mv nagios4-cgi.conf /etc/apache2/conf-enabled/nagios4-cgi.conf 
sudo sed -i 's/use_authentication=0/use_authentication=1/g' /etc/nagios4/cgi.cfg
sudo systemctl restart apache2 
sudo systemctl restart nagios4
## http://PublicIP/nagios4/
## User: nagiosadmin
## Current Status > Hosts > localhost 


wget https://raw.githubusercontent.com/jai28102022/monitor/main/nagios/atos-server-00.cfg
sudo mv atos-server-00.cfg /etc/nagios4/objects/atos-server-00.cfg
wget https://raw.githubusercontent.com/jai28102022/monitor/main/nagios/nagios.cfg
sudo mv nagios.cfg /etc/nagios4/nagios.cfg
sudo systemctl restart nagios4.service 
