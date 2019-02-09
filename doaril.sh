#!/usr/bin/env bash

# Define helper methods.
function version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }
function command_exists () { type "$1" &> /dev/null ;}

sudo apt-get update
sudo apt-get --assume-yes install curl wget git build-essential unzip || exit

NODE_STABLE_BRANCH="9.x"
curl -sL https://deb.nodesource.com/setup_$NODE_STABLE_BRANCH | sudo -E bash -
sudo apt-get install -y nodejs

echo -e "\e[96mYou will be asked for your Azure Dev credentials now. \e[90m"
echo -e "\e[96mTo create them, browse to: https://dev.azure.com/doaril/_usersSettings/altcreds\e[90m"
git clone --depth=1 https://dev.azure.com/doaril/pretotype/_git/pretotype

cd ~/pretotype

npm install
