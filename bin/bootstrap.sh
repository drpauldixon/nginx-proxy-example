#!/bin/bash

# set up a proxy if running behind one
curl -s -m 1 http://10.23.12.100:8080 -o /dev/null

if [ $? -eq 0 ]
then
  export http_proxy=http://10.23.12.100:8080
  export https_proxy=http://10.23.12.100:8080
  grep -q proxy /etc/yum.conf
  if [ $? -ne 0 ]
  then
    echo "Setting YUM proxy to ${http_proxy}."
    echo "proxy=${http_proxy}" >> /etc/yum.conf
  fi
fi

# Stop and disable iptables
service iptables stop
service ip6tables stop
chkconfig iptables off
chkconfig ip6tables off

cp /vagrant/configs/security/limits.conf /etc/security/limits.conf
