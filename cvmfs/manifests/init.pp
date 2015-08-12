#cvmfs/manifests/init.pp
# == Class: cvmfs
#
# This module manages cvmfs
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
# [*cache_base_dir*]
# The directory that CVMS will install its cache
#
#
# [*quota_limit*]
# The cache limit on the node
#
# [*http_proxy*]
# The host and port of the http_proxy
#             
class cvmfs (
  $package_ensure = 'installed',
  $cache_base_dir = '/var/cache/cvmfs',
  $quota_limit    = '20000',
  $http_proxy     = 'localhost:3128',
)
{
  
  class{ 'cvmfs::install':
    package_ensure => $package_ensure,
  }
  
  class{ 'cvmfs::config':
    cache_base_dir => $cache_base_dir,
    quota_limit    => $quota_limit,
    http_proxy     => $http_proxy,
  }
  class{'cvmfs::fuse': }
  Class['cvmfs::install'] -> Class['cvmfs::fuse']
  Class['cvmfs::fuse']    -> Class['cvmfs::config']
 
}


