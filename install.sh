#!/bin/bash
echo BlueKeep AutoExploit script
echo https://github.com/ind3p3nd3nt/BlueRDPSploit;
echo Facebook: https://fb.me/remi.girard2;
echo ---DISCLAIMER--- I AM NOT RESPONSIBLE FOR ANY ACTIONS YOU MAKE WITH THIS PROGRAM. THE ONLY RESPONSIBLE PERSON IS YOU!;
echo "Install required components";
if [ -f /usr/bin/apt ]; then 
echo "Backing up sources.list";
cp /etc/apt/sources.list /root/sources.list.bak -r;
echo "Adding Kali Sources"
echo deb http://kali.download/kali kali-rolling main contrib non-free >/etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ED444FF07D8D0BF6
echo "Updating..."
apt update && apt install git build-essential metasploit-framework masscan libssl-dev -y;
else
yum install epel-release centos-release -y
yum groupinstall 'Development Tools' -y
yum install masscan postgresql -y
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod +x msfinstall
./msfinstall;
fi
systemctl start postgresql
msfdb init
cd;
git clone https://github.com/robertdavidgraham/rdpscan.git;
cd rdpscan;
make -j8;
chmod +x rdpscan;
cp ./rdpscan /usr/bin/rdp;
exit
