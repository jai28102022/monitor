# Install Prometheus 

wget https://raw.githubusercontent.com/jai28102022/monitor/main/install-prometheus.sh
sh install-prometheus.sh
## access http://PublicIP:9090


rm -vf install-node-exporter.sh*
wget https://raw.githubusercontent.com/jai28102022/monitor/main/install-node-exporter.sh
sh install-node-exporter.sh
## access http://PublicIP:9090/targets


wget https://raw.githubusercontent.com/jai28102022/monitor/main/install-grafana.sh
sh install-grafana.sh
## access http://PublicIP:3000/ user: admin password: admin   
## update your password 
