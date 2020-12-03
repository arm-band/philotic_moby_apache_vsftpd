FROM centos
RUN yum -y install epel-release
RUN yum install -y sudo
RUN yum -y install openssh-clients
RUN yum -y install ansible
RUN mkdir /workspace