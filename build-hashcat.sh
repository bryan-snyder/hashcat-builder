#!/bin/sh

echo "Hello..." 
echo "We are going to jump to your home folder, update Apt..." 
echo "and install some packages if they aren't already there, then remove the current version of hashcat"
echo "once packages are installed and hashcat is removes we will build the new version of hashcat from source..."
echo "you will be asked your admin password, then answer everything else affirmative" 
sleep 5
cd ~
sudo apt-get update
sudo apt-get install -y cmake build-essential
sudo apt-get install -y checkinstall git
sudo apt-get remove -y hashcat
sudo apt-get build-dep -y hashcat
sudo rm -rf hashcat
sleep 2
echo "alright... now we clone current hashcat release"
sleep 5
git clone https://github.com/hashcat/hashcat.git
cd hashcat
git submodule update --init
sudo make
sudo checkinstall
echo "lets check the version eh?"
sleep 5
hashcat --version
# hashcat version should be v5.1.0 or newer