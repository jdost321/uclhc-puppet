class xrootd::siab_server {
  
  service { 'xrootd@siab-server':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd', 'xrootd-voms-plugin'],
    subscribe => Class['xrootd::siab_config', 'xrootd::service_cert']
  }
  service { 'cmsd@siab-server':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => Class['xrootd::siab_config']
  }
  service { 'xrootd@siab-redirector':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd', 'xrootd-voms-plugin'],
    subscribe => Class['xrootd::siab_config', 'xrootd::service_cert']
  }
  service { 'cmsd@siab-redirector':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => Class['xrootd::siab_config']
  }
  if ($xrootd::enable_atlas_proxy) {
    service { 'xrootd@siab-atlas-proxy':
      enable => 'true',
      ensure => 'running',
      require => Package['xrootd', 'xrootd-voms-plugin'],
      subscribe => Class['xrootd::siab_config', 'xrootd::service_cert']
    }
  }
  if ($xrootd::enable_cms_proxy) {
    service { 'xrootd@siab-cms-proxy':
      enable => 'true',
      ensure => 'running',
      require => Package['xrootd', 'xrootd-voms-plugin'],
      subscribe => Class['xrootd::siab_config', 'xrootd::service_cert']
    }
  }
}

