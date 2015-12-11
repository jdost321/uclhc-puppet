#gratia_condor_probe/manifests/init.pp
# == Class: gratia_condor_probe
#
# This module manages gratia_condor_probe
# Developed by Edgar Fajardo
# on behalf of UCLHC
#
# == Architecture
# It is made out of two parts:
# gratia_condor_probe::install for installation and cert files
# gratia_condor_probe::config for the actual configuration
# === Parameters
#
# [*package_ensure*]
# Specifies if a package is wanted installed or latest. Only this two vaules are allowed.
#
#
# [*site_name*]
# The site name where the host is installed
#
# [*vo*]
# The cache limit on the node
#
class gratia_condor_probe (
  $package_ensure = 'installed',
  $site_name      = 'UCSD',
  $vo             = 'cms',
)
{
  require condor
  
  class{ 'gratia_condor_probe::install':
    package_ensure => $package_ensure,
  }
  
  class{ 'gratia_condor_probe::config':
    site_name      => $site_name,
    vo             => $vo,
  }

  service{'gratia-probes-cron':
    ensure => 'running',
    enable => true,
   }
  Class['gratia_condor_probe::install'] -> Class['gratia_condor_probe::config']
  Class['gratia_condor_probe::config']  -> Service['gratia-probes-cron']

  

  
 
}


