#!/bin/bash
t1=$(ip a | grep -o eth1 | head -1)
t2='eth1'

u1=$(id -u)
export XDG_RUNTIME_DIR=/run/user/$u1

if [ "$t1" = "$t2" ]; then
  ~/RTPi/venv/bin/python RTPi/rtpled.py eth1 &
else
  ~/RTPi/venv/bin/python RTPi/rtpled.py eth0 &
fi

play -t raw -r 8000 -c 1 -e mu-law ~/RTPi/rtppipe gain 5 &
