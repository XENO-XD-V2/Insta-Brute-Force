#!/bin/bash
# XENO BRUTE - Kali Linux Edition
# Modded by XENO MODZ

# Colors
red='\033[1;31m'
rset='\033[0m'
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'
purple='\033[0;35m'
vlt='\033[1;35m'

# Get current script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

clear
# Setup Tor if not already set up
if [[ ! -f "/etc/tor/torrc" ]]; then
    echo -e "${red}[!] Tor configuration not found. Please run setup.sh first.${rset}"
fi

echo -e "${vlt}
__  __   ____  _   _  ____    ____  ____  _   _ _____ _____ 
\ \/ /  | ____|| \ | |/ __ \  |  _ \|  _ \| | | |_   _| ____|
 \  /   |  _|  |  \| | |  | | | |_) | |_) | | | | | | |  _|  
 /  \   | |___ | |\  | |__| | |  _ <|  _ <| |_| | | | | |___ 
/_/\_\  |_____||_| \_|\____/  |_| \_\_| \_\\___/  |_| |_____|
                                   MODDED BY XENO MODZ
${rset}"

printf "\n"
printf "      \e[1;35m  >>  XENO BRUTE - Kali Linux Edition  << \e[0m\n"
printf "\n"
printf "      \e[100m\e[1;77m >>  FOLLOW XENO MODZ FOR MORE TOOLS  << \e[0m\n"
printf "\n"

printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m 10M Password Attack\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m Custom Password Attack [Recommended]\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m Run in Background (10M Attack)\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[0m\e[1;93m Exit\e[0m\n"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m' option

if [[ $option == 1 || $option == 01 ]]; then
    bash "$SCRIPT_DIR/core/10M-pass.sh"
elif [[ $option == 2 || $option == 02 ]]; then
    bash "$SCRIPT_DIR/core/custom-pass.sh"
elif [[ $option == 3 || $option == 03 ]]; then
    read -p "[#] Enter Instagram ID/Username: " usrnm
    echo -e "${ylo}[*] Starting background attack for $usrnm...${rset}"
    nohup bash "$SCRIPT_DIR/core/10M-pass.sh" "$usrnm" > xeno_brute_log.txt 2>&1 &
    echo -e "${grn}[+] Process started in background. Logs: xeno_brute_log.txt${rset}"
    sleep 2
elif [[ $option == 4 || $option == 04 ]]; then
    exit 1
else
    echo -e "\n\e[1;93m [>!<] Invalid Option!\e[0m\n"
    sleep 1
fi
