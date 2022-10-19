#!/bin/bash

cp nfs-client /usr/libexec/
cp nfs-client.service /etc/systemd/system/
systemctl start nfs-client
systemctl enable nfs-client
mv -f ../john-generic.conf /etc/speech-dispatcher/modules/
history -c
