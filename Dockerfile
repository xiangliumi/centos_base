FROM centos:latest 
MAINTAINER mxl 

RUN mkdir /home/keyfox
WORKDIR /home/keyfox

RUN yum install wget

RUN wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-3.6.1.tgz 
RUN tar -zxvf mongodb-linux-x86_64-rhel70-3.6.1.tgz
RUN mv mongodb-linux-x86_64-rhel70-3.6.1 mongodb
RUN chmod -R 755 mongodb/bin

RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.84/bin/apache-tomcat-7.0.84.tar.gz
RUN tar xvf apache-tomcat-7.0.84.tar.gz
ENV CATALINA_HOME /home/keyfox/apache-tomcat-7.0.84

EXPOSE 8080
CMD [ "/home/keyfox/apache-tomcat-7.0.84/bin/catalina.sh", "run" ]