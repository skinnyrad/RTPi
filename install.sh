#!/bin/bash
version=$(ls /usr/bin/python*.* | head -1)
cd ~
sudo apt-get update
sudo apt-get -y install tcpdump sox libsox-fmt-all scapy
mkfifo ~/RTPi/rtppipe

#Set python and tcpdump so they don't need to use admin to run
sudo setcap cap_net_raw=eip $version
sudo setcap cap_net_raw=eip /usr/bin/tcpdump

#Installing Python Virtual Environment stuff
cd RTPi
git clone https://github.com/pimoroni/blinkt -b repackage
python -m venv venv
source venv/bin/activate
cd blinkt
./install.sh --unstable
pip install scapy
