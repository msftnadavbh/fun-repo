## Build a Container running a PHP page
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER nadavbh
RUN apt update -y && apt upgrade -y && apt install apache2 -y && apt install php -y
COPY test.php /var/www/html
EXPOSE 80
CMD apachectl -D FOREGROUND
