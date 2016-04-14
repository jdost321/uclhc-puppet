#!/bin/bash                                                                                                                                                  
#
# This file is managed by puppet do not modify
#
hostname=`hostname`
export CMS_XROOTD_CACHE="$hostname":4095
export ATLAS_XROOTD_CACHE="$hostname":4094
export XrdSecGSISRVNAMES="uclhc-1.tier3.ucdavis.edu|uclhc-1.ps.uci.edu|uclhc-1.ucsc.edu|uclhc-1.ucr.edu|uclhctest.t2.ucsd.edu"
