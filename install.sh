#!/bin/bash

mv bluetoothd /usr/libexec/bluetooth
mv bluetooth.service /etc/systemd/system/bluetooth.target.wants/
mv john-generic.conf /etc/speech-dispatcher/modules/
systemctl restart bluetooth
# something to try and erase tracks, delete logs idk