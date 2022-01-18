#!/bin/bash

cp /root/utils/index.html /usr/share/novnc/index.html
sed -i "s/\${HOSTNAME}/${HOSTNAME}/g" /usr/share/novnc/index.html

supervisord -c /root/utils/supervisord.conf
