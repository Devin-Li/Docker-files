#!/bin/bash

#set -e

#[ -d /etc/nginx/certs ] || mkdir -p /etc/nginx/certs
#chown nginx:nginx /etc/nginx/certs

[ -d /var/nginx/DropLocation ] || mkdir -p /var/nginx/DropLocation
/usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"
