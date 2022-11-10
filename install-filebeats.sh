sudo apt install filebeat
sudo cat /etc/filebeat/filebeat.yml
sudo filebeat modules enable system
sudo filebeat modules enable nginx
sudo systemctl start filebeat
sudo systemctl enable filebeat
curl -XGET 'http://localhost:9200/filebeat-*/_search?pretty'
