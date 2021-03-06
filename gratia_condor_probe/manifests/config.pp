# gratia_condor_probe/manifests/config.pp
# == Class: gratia_condor_probe::install ===========================
#
# This module manages gratia_condor_probe installation and auxilary software
# ===========================================
# Developed by Edgar Fajardo
# on behalf of OSG Software
# == Architecture ======================
#
# === Parameters =========================
#
#
# [*site_name*]
# The site name where the host is installed
#
# [*vo*]
# The cache limit on the node
#           
class gratia_condor_probe::config (
    $site_name = 'ucsd',
    $vo        = "cms",
    )
{
    file {'ProbeConfig':
      path    => '/etc/gratia/condor/ProbeConfig',
      ensure  => present,
      content => template('gratia_condor_probe/ProbeConfig.erb'),
    }

    file {'50-gratia_probe.config':
      path   => '/etc/condor/config.d/50-gratia_probe.config',
      ensure => present,
      source => 'puppet:///modules/gratia_condor_probe/50_gratia_probe.config',
    }
    
}
