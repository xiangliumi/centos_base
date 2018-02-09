FROM centos:latest 
MAINTAINER mxl

COPY mongodb.repo /etc/yum.repos.d

ADD LanProbe.tar.gz /home

RUN yum -y update
RUN yum -y install mongodb-org
RUN yum -y install wget

RUN mkdir /home/keyfox
WORKDIR /home/keyfox

RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.84/bin/apache-tomcat-7.0.84.tar.gz
RUN tar xvf apache-tomcat-7.0.84.tar.gz
ENV CATALINA_HOME /home/keyfox/apache-tomcat-7.0.84

EXPOSE 8080
CMD [ "/home/keyfox/apache-tomcat-7.0.84/bin/catalina.sh", "run" ]