sudo apt install kibana nginx -y 
sudo systemctl enable kibana
sudo systemctl start kibana
echo "kibana:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users


cat <<EOF | sudo tee /etc/nginx/sites-available/default 
server {
    listen 80;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF


sudo systemctl reload nginx
## Access kibana on http://PublicIP
