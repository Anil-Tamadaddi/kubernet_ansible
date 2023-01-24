FROM nginx
MAINTAINER aniltamadaddi9436@gmail.com
EXPOSE 80 22

#FROM tomcat
#MAINTAINER aniltamadaddi9436@gmail.com
#EXPOSE 8080

#ENTRYPOINT ["echo", "Hello Anil"]

#FROM  ubuntu:latest
#MAINTAINER anil@gmail.com
#RUN apt update
#RUN apt install -y micro-httpd \
# zip\
# unzip
#ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
#WORKDIR /var/www/html/
#RUN unzip photogenic.zip
#RUN cp -rvf photogenic/* .
#RUN rm -rf photogenic photogenic.zip
#CMD ["/usr/sbin/micro-httpd", "-D", "FOREGROUND"]
#EXPOSE 80
 
 
# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip shine.zip
# RUN cp -rvf shine/* .
# RUN rm -rf shine shine.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80   

