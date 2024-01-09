#! /bin/bash

echo "Launching svn on \"$DIR_SVN\", repos: $@"
_r=
for _r; do
  if [[  -d "$DIR_REPO/$_r" ]]; then
    echo "svn repo \"$_r\" has installed."
  else
    echo "Creating repo \"$_r\"..."
    mkdir -p $DIR_REPO && svnadmin create $DIR_REPO/$_r
    echo "Created repo \"$_r\"."
  fi
done
echo "Starting sshd..,"
/usr/sbin/sshd -D 

