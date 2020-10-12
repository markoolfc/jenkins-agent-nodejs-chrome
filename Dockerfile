FROM openshift/jenkins-slave-base-centos8

USER root

RUN curl --silent --location https://rpm.nodesource.com/setup_current.x | bash -

RUN yum -y install nodejs && yum clean all -y

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME
    
COPY google-chrome.repo /etc/yum.repos.d/ 
RUN yum -y install google-chrome-stable && yum clean all -y

RUN chgrp -R 0 /opt/google
RUN chmod -R g+rw /opt/google

RUN chmod 4755 /opt/google/chrome/chrome-sandbox

USER 1001
