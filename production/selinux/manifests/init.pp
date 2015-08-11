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
  $sestatus    = '0',
  $mode        = 'Permissive'
)
{

  exec { "change-selinux-status-to-${mode}":
    command => "setenforce ${sestatus}",
    unless  => "getenforce | grep -qi \"${mode}\\|disabled\"",
    path    => '/bin:/usr/bin:/usr/sbin',
  }
      
  file {'/etc/selinux/config':
    ensure  => 'present',
    source => 'puppet:///modules/selinux/config'
  }
  
 
}


