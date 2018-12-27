FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y  vsftpd \
    && apt-get install -y vim  \
    && apt-get install -y ftp \
    && apt-get install -y db-util \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


ENV FTP_USER=ftpuser \
    FTP_PASS="Tdy7MJYekc\$kU4avj{X]3LKW]" \
    PASV_ADDRESS=127.0.0.1 \
    PASV_MIN_PORT=65000 \
    PASV_MAX_PORT=65001


COPY vsftpd.conf /etc/
COPY vsftpd_virtual /etc/pam.d/
COPY setup.sh /setup.sh

RUN chmod +x /setup.sh \
    && mkdir -p /var/vsftpd/ \
    && chown -R ftp:ftp /var/vsftpd/ \
    && mkdir -p var/run/vsftpd/empty

VOLUME /var/vsftpd
VOLUME /var/log/vsftpd

EXPOSE 20 21
EXPOSE 65500 65501

ENTRYPOINT ["/setup.sh"]
