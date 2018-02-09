FROM centos:latest 
MAINTAINER mxl

ADD mongodb.repo /etc/yum.repos.d
RUN yum update
RUN yum install -y mongodb-org

RUN yum install -y wget

RUN mkdir /home/keyfox
WORKDIR /home/keyfox

RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.84/bin/apache-tomcat-7.0.84.tar.gz
RUN tar xvf apache-tomcat-7.0.84.tar.gz
ENV CATALINA_HOME /home/keyfox/apache-tomcat-7.0.84

EXPOSE 8080
CMD [ "/home/keyfox/apache-tomcat-7.0.84/bin/catalina.sh", "run" ]