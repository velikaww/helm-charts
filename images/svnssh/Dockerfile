FROM swr.cn-east-3.myhuaweicloud.com/regiswang/testcontainers/sshd:1.1.0

ENV DIR_SVN=/var/svn
ENV DIR_REPO=$DIR_SVN/repos

RUN apk add subversion shadow && usermod -s /bin/ash svn
ADD start.sh /opt/svnssh/
RUN chmod +x /opt/svnssh/start.sh
RUN su svn -c 'mkdir -p $DIR_SVN/.ssh && mkdir -p $DIR_REPO'

VOLUME [ "/etc/ssh", "$DIR_SVN/.ssh", "$DIR_REPO" ]
WORKDIR /opt/svnssh
EXPOSE  22

ENTRYPOINT [ "sh", "/opt/svnssh/start.sh" ]
CMD [ ]

