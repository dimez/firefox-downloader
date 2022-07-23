#!/bin/sh

# Russian version
#URL="https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=ru"
# English version
URL="https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"

VER=`curl -sfI "$URL" | grep -o 'firefox-[0-9.]\+[0-9]'`
if [ ! -d "/opt/$VER" ]
then
 mkdir /opt/$VER
 cd /opt
 curl -sL "$URL" -o $VER.tar.bz2
 tar xjf $VER.tar.bz2 --strip-components=1 -C $VER
 ln -sf $VER firefox
else
 echo "Latest version already installed"
fi
