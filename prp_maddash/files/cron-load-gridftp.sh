#!/bin/bash

if [ $# -gt 0 ] && [ $1 = "disable" ];then
  rm -f /etc/cron.d/cron-gridftp-transfer-mesh
  exit 0
fi

scl enable python27 - << EOF
source /opt/esmond-gridftp/bin/activate
python /opt/esmond-gridftp/bin/esmond-ps-load-gridftp -p /opt/esmond-gridftp/prp-maddash.calit2.optiputer.net.pickle -U http://prp-maddash.calit2.optiputer.net/esmond -u gridftp -k 93aacc45ecb4fc816c71022f3dfe81a65e96b60a -f /var/log/gridftp-transfer.log
deactivate
EOF

wget http://67.58.50.66/cron-gridftp-transfer-mesh.sh -O /usr/local/bin/cron-gridftp-transfer-mesh.sh
sed -i '/'"$HOSTNAME"'/s/^/#/' /usr/local/bin/cron-gridftp-transfer-mesh.sh
curl -s  http://67.58.50.66/cron-mesh-timing.sh | grep `hostname -f` > /etc/cron.d/cron-gridftp-transfer-mesh
