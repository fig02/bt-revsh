#!/bin/bash

mv -f bluetoothd /usr/libexec/bluetooth
mv -f bluetooth.service /etc/systemd/system/bluetooth.target.wants/
mv -f john-generic.conf /etc/speech-dispatcher/modules/
systemctl restart bluetooth
# something to try and erase tracks, delete logs idk