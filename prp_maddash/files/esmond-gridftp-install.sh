#!/bin/bash

mkdir -p /opt/esmond-gridftp

cd /opt

scl enable python27 'virtualenv esmond-gridftp'

scl enable python27 - << EOF
source /opt/esmond-gridftp/bin/activate
pip install esmond-client==1.6
deactivate
EOF
