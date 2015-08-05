# ganglia/manifests/config.pp
# == Class: ganglia::config ===========================
#
# This module manages cvmfs installation and auxilary software
# ===========================================
# Developed by Edgar Fajardo
# on behalf of OSG Software
# == Architecture ======================
#
# === Parameters =========================
#
#
# [*gmetad*]
# gmeta the host which run the the gmetad module
#
#
class ganglia::config (
    $gmetad     = "uclhc-fe-1.t2.ucsd.edu",
    )
{
    file {'uclhc.conf':
      path   => '/etc/ganglia/conf.d/uclhc.conf',
      ensure => present,
      content => template('ganglia/uclhc.conf.erb')
    }

}
