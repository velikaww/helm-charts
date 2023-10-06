FROM swr.cn-east-3.myhuaweicloud.com/regiswang/testcontainers/sshd:1.1.0

ENV DIR_SVN=/var/svn

RUN apk add subversion
ADD start.sh /opt/svnssh/
RUN chmod +x /opt/svnssh/start.sh

ENV DIR_REPO=$DIR_SVN/repos
VOLUME [ "/etc/ssh", "$DIR_SVN/.ssh", "$DIR_REPO" ]
WORKDIR /opt/svnssh
EXPOSE  22

ENTRYPOINT [ "sh", "/opt/svnssh/start.sh" ]
CMD [ ]

