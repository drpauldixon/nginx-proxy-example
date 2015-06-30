#!/bin/bash

# Install nginx
rpm --quiet -q nginx
if [ $? -ne 0 ]
then
  echo "Installing package: nginx"
  rpm -ivh /vagrant/packages/nginx-1.4.2-1.el5.ngx.x86_64.rpm
fi

# Copy the config
rsync -av --delete  /vagrant/configs/nginx /etc/

# Start / restart nginx
pgrep -l nginx$
if [ $? -ne 0 ]
then
  service nginx start
else
  service nginx restart
fi
