FROM registry.access.redhat.com/ubi7/ubi
USER root

RUN curl --silent --location https://rpm.nodesource.com/setup_current.x | bash -

RUN yum --disableplugin=subscription-manager -y install nodejs && yum clean all -y

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME
    
COPY google-chrome.repo /etc/yum.repos.d/ 
RUN yum --disableplugin=subscription-manager -y install firefox && yum clean all -y

USER 1001
