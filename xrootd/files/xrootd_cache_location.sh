#!/bin/bash                                                                                                                                                  
#
# This file is managed by puppet do not modify
#
hostname=`hostname`
export CMS_XROOTD_CACHE="$hostname":4095
export ATLAS_XROOTD_CACHE="$hostname":4094
