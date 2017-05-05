#frontier_squid/manifests/init.pp
# == Class: frontier_squid
#
# This module manages cvmfs
# Developed by Edgar Fajardo
# on behalf of UCLHC
#
# == Architecture
# It is made out of two parts:
# frontier_squid::install for installation and cert files
# frontier_squid::config for the actual configuration
# === Parameters
#
# [*package_ensure*]
# Specifies if a package is wanted installed or latest. Only this two vaules are allowed.
#
#
class frontier_squid (
  $package_ensure = 'installed',
)
{
  #include osg_release
  class{ 'frontier_squid::install':
    package_ensure => $package_ensure,
  }
  
  class{ 'frontier_squid::config':
  }

  
  Class['frontier_squid::install'] -> Class['frontier_squid::config']
 
}


