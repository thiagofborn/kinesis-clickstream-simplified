#!/usr/bin/env bash
#
#set -o errexit
#set -o pipefail
#
# Description: 
# Author: Thiago Born. e-mail: thiagofborn@gmail.com
#------------------------------------------------------

ip=`ifconfig en0 | grep inet  | grep -v inet6 | awk '{print $2}'`
name=myip 
export ip myip
ipname="$ip $name"

sed -i -e  "s/.*myip*/$ipname/g" /etc/hosts