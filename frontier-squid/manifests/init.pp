#frontier-squid/manifests/init.pp
# == Class: frontier-squid
#
# This module manages cvmfs
# Developed by Edgar Fajardo
# on behalf of UCLHC
#
# == Architecture
# It is made out of two parts:
# frontier-squid::install for installation and cert files
# frontier-squid::config for the actual configuration
# === Parameters
#
# [*package_ensure*]
# Specifies if a package is wanted installed or latest. Only this two vaules are allowed.
#
#
class frontier-squid (
  $package_ensure = 'installed',
)
{
  #include osg_release
  class{ 'frontier-squid::install':
    package_ensure => $package_ensure,
  }
  
  class{ 'frontier-squid::config':
  }

  
  Class['frontier-squid::install'] -> Class['frontier-squid::config']
 
}


