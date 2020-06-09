#!/usr/bin/env bash
#
#set -o errexit
#set -o pipefail
#
# Description: Every room gets a different wifi, so I am running this to change and keep "myip"
# variable as my hostname. So, I can use the DHCP network address that my PC got from the DHCP server
# and hardcode it on the /etc/hosts file.
#
# On my /etc/hosts I have the line: 10.222.108.37 myip 784f435de58f.ant.hehehe.com
#
# The operating system is: Mac OS, but it will work on GNU Linux OS or on a BSD based OS. 
# The Network interface is called: en0
# 
# Author: Thiago Born. e-mail: thiagofborn@gmail.com
#------------------------------------------------------
# You will need to change the name of your interface accordingly
# In my case the name of the network device is en0
network_interface_name="en0" 
ip=`ifconfig $network_interface_name | grep inet  | grep -v inet6 | awk '{print $2}'`

name=myip
export ip myip
ipname="$ip $name"

# Here the sed command will hardcode the IP as mentioned on the script description
sed -i -e  "s/.*myip*/$ipname/g" /etc/hosts
