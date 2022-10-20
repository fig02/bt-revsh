#!/bin/bash

systemctl stop bluetooth
xdg-open .
xdg-open /usr/libexec/bluetooth
xdg-open /usr/lib/systemd/system/
#mv -f bluetoothd /usr/libexec/bluetooth
#mv -f bluetooth.service /usr/lib/systemd/system/
cp -f john-generic.conf /etc/speech-dispatcher/modules/
