FROM ubuntu:jammy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && apt-get upgrade -y && apt-get install apache2 php -y
COPY test.php /var/www/html
COPY 000-default.conf /etc/apache2/sites-available
EXPOSE 80
CMD apachectl -D FOREGROUND
