FROM amazonlinux

RUN yum -y update && \
  yum -y install wget && \
  yum -y install tar.x86_64 && \
  yum -y install gzip && \
  yum -y install which && \
  yum -y install make gcc* && \
  yum -y install zip && \
  yum clean all

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN /bin/bash -c "source /root/.nvm/nvm.sh; nvm install 8.11.3"

RUN { \
  echo 'export NVM_DIR=~/.nvm'; \
  echo '. ~/.nvm/nvm.sh'; \
  } > /root/.bashrc

CMD /bin/bash -c "source /root/.nvm/nvm.sh; nvm use 8.11.3"