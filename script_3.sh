#!/bin/bash
yum update -y
yum install epel-release -y
yum install nginx -y
yum install setools-console -y
yum install policycoreutils-python -y
yum install setools -y
yum install -y setroubleshoot-server
sed -i 's/80/8041/' /etc/nginx/nginx.conf
semanage port -a -t http_port_t -p tcp 8041
systemctl enable nginx.service
systemctl start nginx
curl 127.0.0.1:8041
