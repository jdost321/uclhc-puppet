#ganglia/manifests/init.pp
# == Class: ganglia
#
# This module manages ganglia
# Developed by Edgar Fajardo
# on behalf of UCLHC
#
# == Architecture
# It is made out of two parts:
# cvmfs::install for installation and cert files
# cvmfs::config for the actual configuration
# === Parameters
#
# [*package_ensure*]
# Specifies if a package is wanted installed or latest. Only this two vaules are allowed.
#
#
# [*gmetad*]
# The host where gmetad is installed
#             
class ganglia(
  $package_ensure = 'installed',
  $gmetad     = 'uclhc-fe-1.t2.ucsd.edu',
)
{
  
  class{ 'ganglia::install':
    package_ensure => $package_ensure,
  }
  
  class{ 'ganglia::config':
    gmetad => $gmetad,
  }
  class{ 'ganglia::service':
  }
  Class['ganglia::install'] -> Class['ganglia::config']
  Class['ganglia::config']    -> Class['ganglia::service']
 
}


