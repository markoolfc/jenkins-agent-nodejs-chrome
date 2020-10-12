FROM quay.io/openshift/origin-jenkins-agent-nodejs
USER root
COPY google-chrome.repo /etc/yum.repos.d/ 
RUN  yum -y install google-chrome-stable && yum clean all -y

RUN chgrp -R 0 /opt/google
RUN chmod -R g+rw /opt/google

RUN chmod 4755 /opt/google/chrome/chrome-sandbox

USER 1001
