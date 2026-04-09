#!/bin/bash
# XENO BRUTE Setup - Optimized for Kali Linux
# Modified by XENO MODZ

clear
echo -e "\e[1;31m [!] Setting up Required Packages for Kali Linux \e[0m"
sleep 1

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root (use sudo bash setup.sh)"
  exit
fi

echo -e "\e[1;32m[*] Updating system... \e[0m"
apt-get update -y
apt-get upgrade -y

echo -e "\e[1;32m[*] Installing dependencies... \e[0m"
apt-get install python3 python3-pip tor git wget lolcat -y

echo -e "\e[1;32m[*] Installing Python modules... \e[0m"
pip3 install --upgrade pip
pip3 install requests requests[socks] stem lolcat instagram-py

echo -e "\e[1;32m[*] Configuring Tor... \e[0m"
# Create backup of existing torrc if it exists
if [ -f "/etc/tor/torrc" ]; then
    cp /etc/tor/torrc /etc/tor/torrc.bak
fi

# Copy our custom torrc
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cp "$SCRIPT_DIR/torrc" /etc/tor/torrc

echo -e "\e[1;32m[*] Downloading Instagram-py config... \e[0m"
wget -O "$HOME/instapy-config.json" "https://git.io/v5DGy"

echo -e "\e[1;36m[+] Setup Complete! \e[0m"
echo -e "\e[1;33m[*] To start the tool, run: bash xeno_brute.sh \e[0m"

# Optional: restart tor
systemctl restart tor
