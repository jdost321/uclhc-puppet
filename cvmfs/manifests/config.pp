# cvmfs/manifests/config.pp
# == Class: cvmfs::install ===========================
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
class cvmfs::config (
    $cache_base_dir = '/var/cache/cvmfs',
    $quota_limit    = "20000",
    $http_proxy     = "localhost:3128",
    )
{
    file {'default.local':
      path   => '/etc/cvmfs/default.local',
      ensure => present,
      content => template('cvmfs/default.local.erb')
    }

#    file_line{'CVMFS_REPOSITORIES':
#      require => File['default.local'],
#      path    => '/etc/cvmfs/default.local',
#      line    => "CVMFS_REPOSITORIES="`echo $((echo oasis.opensciencegrid.org;echo cms.cern.ch;ls /cvmfs)|sort -u)|tr ' ' ,`"",
#    }

#    file_line{'CVMFS_CACHE_BASE':
 #     require => File['default.local'],
  #    path    => '/etc/cvmfs/default.local',
   #   line    => 'CVMFS_CACHE_BASE=${cache_base_dir}',
   # }

    #file_line{'CVMFS_QUOTA_LIMIT':
    #   require => File['default.local'],
    #   path    => '/etc/cvmfs/default.local',
    #   line    => 'CVMFS_QUOTA_LIMIT=${quota_limit}',
    #}

    #file_line{'CVMFS_HTTP_PROXY':
    #  require => File['default.local'],
    #  path    => '/etc/cvmfs/default.local',
    #  line    => 'CVMFS_HTTP_PROXY=${http_proxy}',
   # }

}
