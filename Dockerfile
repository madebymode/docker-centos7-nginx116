From centos:7

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://repo.ius.io/ius-release-el7.rpm
# Update and install latest packages and prerequisites
RUN yum update -y \
    && yum install -y --nogpgcheck --setopt=tsflags=nodocs \
        nginx \
    && yum clean all && yum history new

# default values to connect to php-fpm
ENV PHP_HOST php
ENV PHP_PORT 9000

EXPOSE 80
EXPOSE 443

RUN sed -e '/^http {/,/^}/{/^}/i\include \/etc\/nginx\/sites\-enabled\/\*\.conf\;' -e '}' /etc/nginx/nginx.conf

#start nginx
CMD [ "nginx", "-g", "daemon off;"]
