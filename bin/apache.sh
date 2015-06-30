#!/bin/bash
#set -x

package(){
  # Function to install a package if it is not already installed.
  # Usage: package <package-name>
  rpm --quiet -q $1
  if [ $? -ne 0 ]
  then
    echo "Installing package: ${1}"
    yum -y install $1
  fi
}

# Install packages
package httpd
chkconfig httpd on
pgrep -l httpd$ > /dev/null

if [ $? -ne 0 ]
then
  service httpd start
fi

cd /var/www/html
[ ! -f 15mb.html ] && dd if=/dev/zero of=15mb.html count=15360 bs=1024
[ ! -f 20mb.html ] && dd if=/dev/zero of=20mb.html count=20480 bs=1024
[ ! -f 25mb.html ] && dd if=/dev/zero of=25mb.html count=25600 bs=1024
echo hello > index.html
chmod 0644 *.html

