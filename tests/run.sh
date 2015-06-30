#!/bin/bash
set -x

wget --no-proxy --header "Host: dashboard.local" http://172.16.12.101/15mb.html
wget --no-proxy --header "Host: dashboard.local" http://172.16.12.101/20mb.html
wget --no-proxy --header "Host: dashboard.local" http://172.16.12.101/25mb.html

rm -f *.html
