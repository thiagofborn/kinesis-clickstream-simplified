#!/usr/bin/env bash
#
#set -o errexit
#set -o pipefail
#
# Description: Every room gets a different wifi, so I am running this to change and keep "myip" as my
# hostname.
# On my /etc/hosts I have the line: 10.222.108.37 myip 784f435de58f.ant.hehehe.com
# It is Mac OS. Network interface en0
# 
# Author: Thiago Born. e-mail: thiagofborn@gmail.com
#------------------------------------------------------
ip=`ifconfig en0 | grep inet  | grep -v inet6 | awk '{print $2}'`
name=myip
export ip myip
ipname="$ip $name"

sed -i -e  "s/.*myip*/$ipname/g" /etc/hosts
