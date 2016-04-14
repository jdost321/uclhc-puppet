#!/bin/sh                        
#                                                                                                                            
# This file is managed by Puppet do not modify
#
#
setenv hostname `hostname`
setenv CMS_XROOTD_CACHE "$hostname":4095
setenv ATLAS_XROOTD_CACHE "$hostname":4094
setenv XrdSecGSISRVNAMES "uclhc-1.tier3.ucdavis.edu|uclhc-1.ps.uci.edu|uclhc-1.ucsc.edu|uclhc-1.ucr.edu|uclhctest.t2.ucsd.edu"
