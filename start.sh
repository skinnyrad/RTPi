t1=$(ip a | grep -o eth1 | head -1)
t2='eth1'
if [ "$t1" = "$t2" ]; then
  python ~/RTPi/rtpled.py eth1 &
else
  python ~/RTPi/rtpled.py eth0 &
fi
aplay -t raw -c 1 -f MU_LAW -r 8000 ~/RTPi/rtppipe &