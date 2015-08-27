#!/bin/sh                        
#                                                                                                                            
# This file is managed by Puppet do not modify
#
#
hostname=`hostname`
setenv CMS_XROOTD_CACHE "$hostname":4095
setenv ATLAS_XROOTD_CACHE "$hostname":4094
