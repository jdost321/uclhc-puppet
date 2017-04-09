#!/bin/bash

output_dir=/var/lib/gwms-factory/condor

if [ $# -lt 2 ];then
  echo "not enough args" 1>&2
  exit 1
fi

cd /tmp
wget $1/$2

if [ $? -ne 0 ];then
  echo "failed to fetch file: ${1}/${2}" 1>&2
  exit 1
fi

create_condor_tarball ${output_dir}/${2} $2
if [ $? -ne 0 ];then
  echo "failed to create stripped tarball: ${output_dir}/${2}" 1>&2
  rm /tmp/${2}
  exit 1
fi

rm /tmp/${2}
