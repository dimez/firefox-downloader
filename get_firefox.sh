#!/bin/sh

#set -x

URL="https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
VER=`curl -sfI "$URL" | grep -o 'firefox-[0-9.]\+[0-9]'`
if [ ! -s "/opt/$VER.tar.bz2" ]
then
 cd /opt
 mv firefox firefox.prev
 curl -sL "$URL" -o $VER.tar.bz2
 tar xjf $VER.tar.bz2
else
 echo "Latest version already downloaded."
fi
