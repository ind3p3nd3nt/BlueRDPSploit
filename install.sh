#!/bin/bash
echo BlueKeep AutoExploit script by independent, DEPLOYING;
echo https://github.com/ind3p3nd3nt/BlueRDPSploit;
echo Facebook: https://fb.me/remi.girard2;
echo LinkedIn: https://rebrand.ly/1091c;
echo ---DISCLAIMER--- I AM NOT RESPONSIBLE FOR ANY ACTIONS YOU MAKE WITH THIS PROGRAM. THE ONLY RESPONSIBLE PERSON IS YOU!;
echo "Backing up sources.list";
cp /etc/apt/sources.list /root/sources.list.bak -r;
echo "Install required components";
echo "Adding Kali Sources";
echo deb http://kali.download/kali kali-rolling main contrib non-free >/etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ED444FF07D8D0BF6;
echo "Updating...";
apt update && apt install git metasploit-framework libssl-dev -y;
service postgresql start;
msfdb init;
apt install masscan -y
cd ..;
git clone https://github.com/robertdavidgraham/rdpscan.git;
cd rdpscan;
make -j8;
chmod +x rdpscan;
cp ./rdpscan ../rdp;
cd ..;
echo "Restoring original sources.list";
cp /root/sources.list.bak /etc/apt/sources.list -r;
