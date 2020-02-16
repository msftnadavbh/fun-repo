## Build a Container running a PHP page
FROM testacr03.azurecr.io/ubuntubionic:v1
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER nadavbh
RUN apt-get update -y && apt-get upgrade -y && apt-get install apache2 -y && apt-get install php -y && apt-get install uuid-runtime -y
RUN uuidgen > ~/guid.txt
COPY test.php /var/www/html
EXPOSE 80
CMD apachectl -D FOREGROUND
