#selinux/manifests/init.pp
# == Class: selinux
#
# This module manages selinux
# Developed by Edgar Fajardo
# on behalf of UCLHC
#
# === Parameters
#
# [*enabled*]
# The host and port of the http_proxy
#             
class selinux (
  $enabled    = '0',
)
{
  file {'/selinux/enforce':
    ensure  => 'present',
    content => '$enabled',
    }

  file {'/etc/selinux/config':
    ensure  => 'present',
    source => 'puppet:///modules/selinux/config'
  }
  
 
}


