#!/bin/bash

FTP_USER=${FTP_USER:-ftpuser}
if [ "$FTP_PASS" = '' ];then
	FTP_PASS='acad.ci!123'
fi

mkdir -p "/var/vsftpd/${FTP_USER}"
chown -R ftp:ftp /var/vsftpd/

[ -d /etc/vsftpd ] || mkdir -p /etc/vsftpd/
[ -f /var/log/vsftpd ] || mkdir -p  /var/log/vsftpd/

echo -e "${FTP_USER}\n${FTP_PASS}" > /etc/vsftpd/virtual_users.txt
/usr/bin/db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

# Set passive mode parameters:
export PASV_ADDRESS=127.0.0.1

echo "pasv_address=${PASV_ADDRESS}" >> /etc/vsftpd.conf


/usr/sbin/vsftpd /etc/vsftpd.conf
#/etc/init.d/vsftpd start > /dev/null
