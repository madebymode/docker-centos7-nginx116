FROM centos/nginx-116-centos7
MAINTAINER madebymode

# default values to connect to php-fpm
ENV PHP_HOST php
ENV PHP_PORT 9000
