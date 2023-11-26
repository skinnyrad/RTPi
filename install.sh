#!/bin/bash
version=$(ls /usr/bin/python*.* | head -1)
cd ~
sudo apt-get update
curl https://get.pimoroni.com/blinkt | bash
sudo apt-get install tcpdump
sudo apt-get install scapy
mkfifo ~/RTPi/rtppipe

#Set python and tcpdump so they don't need to use admin to run
sudo setcap cap_net_raw=eip $version
sudo setcap cap_net_raw=eip /usr/bin/tcpdump
