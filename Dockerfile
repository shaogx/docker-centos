FROM centos:centos7
MAINTAINER shaogx@aliyun.com 
RUN yum update -y && yum install -y tar wget curl && mkdir -p /usr/java && curl -sS https://storage.googleapis.com/mpub/java/jdk-8u65-linux-x64.gz \
  | tar -zxvC /usr/java

ENV JAVA_HOME /usr/java/jdk1.8.0_65/
RUN echo 'root:12321' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
ENV PATH=${JAVA_HOME}/bin:${PATH}

EXPOSE 22
