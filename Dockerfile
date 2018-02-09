FROM centos:latest 
MAINTAINER mxl 
RUN yum -y update 
RUN yum -y install systemd systemd-libs 
RUN yum clean all; 
VOLUME [ "/sys/fs/cgroup" ] 
CMD ["/usr/sbin/init"]
