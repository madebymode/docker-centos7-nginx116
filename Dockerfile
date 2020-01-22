From centos:7

#Install epel-release repo
RUN yum -y install --setopt=tsflags=nodocs epel-release &&
yum -y install --setopt=tsflags=nodocs nginx &&
yum clean all


# default values to connect to php-fpm
ENV PHP_HOST php
ENV PHP_PORT 9000

EXPOSE 80
EXPOSE 443
#start nginx
CMD [ “nginx”, “-g”, “daemon off;”]
