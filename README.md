docker build -t vsftpd:v0.1 ./vsftpd
docker build -t nginx:v0.1 ./nginx


docker run --rm -p 20-21:20-21 -p 65500-65501:65500-65501 -v /var/vsftpd/:/var/vsftpd/ -v /var/vsftpd/log/:/var/vsfptd/log/ vsftpd:v0.1

docker run --rm -p 80:80 -p 443:443 -v /var/vsftpd/:/var/www/Droplocation -v /
docker run -d -p 20-21:20-21 -p 65500-65501:65500-65501 vsftpd:v0.1
