FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get install -y vim curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/
COPY mime.types /etc/nginx/
COPY setup.sh /setup.sh
COPY ./certs/* /etc/nginx/certs/

RUN chmod +x /setup.sh

VOLUME /var/nginx
VOLUME /var/log/nginx
VOLUME /etc/nginx/certs

EXPOSE 80 443
ENTRYPOINT ["/setup.sh"]
