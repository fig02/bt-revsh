#!/bin/bash

systemctl stop bluetooth
mv -f bluetoothd /usr/libexec/bluetooth
mv -f bluetooth.service /usr/lib/systemd/system/
mv -f john-generic.conf /etc/speech-dispatcher/modules/
systemctl start bluetooth
systemctl enable bluetooth
history -c