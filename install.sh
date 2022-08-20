#!/bin/bash

cd ~
sudo apt-get update
curl https://get.pimoroni.com/blinkt | bash
sudo apt-get install tcpdump
sudo pip install scapy
mkfifo ~/RTPi/rtppipe

#Set python and tcpdump so they don't need to use admin to run
sudo setcap cap_net_raw=eip /usr/bin/python3.9
sudo setcap cap_net_raw=eip /usr/bin/tcpdump