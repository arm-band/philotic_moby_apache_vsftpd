FROM centos:7
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
    && yum -y update && yum -y install \
    epel-release \
    sudo \
    openssh-clients \
    # cleaning
    && yum clean all \
    # locale, timezone
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN yum -y install \
    ansible
# local & timezone
ENV LANG="ja_JP UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8" \
    TZ="Asia/Tokyo"
RUN mkdir /ansible
RUN mkdir /rsakey
RUN mkdir /workspace
RUN mkdir /command_ansible