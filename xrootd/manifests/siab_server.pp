class xrootd::siab_server {
  
  service { 'xrootd@siab-server':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd', 'xrootd-voms-plugin'],
    subscribe => Class['xrootd::base_config', 'xrootd::siab_config', 'xrootd::proxy_config', 'xrootd::service_cert']
  }
  service { 'cmsd@siab-server':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => Class['xrootd::base_config', 'xrootd::siab_config']
  }
  service { 'xrootd@siab-redirector':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd', 'xrootd-voms-plugin'],
    subscribe => Class['xrootd::base_config', 'xrootd::siab_config', 'xrootd::proxy_config', 'xrootd::service_cert']
  }
  service { 'cmsd@siab-redirector':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => Class['xrootd::base_config', 'xrootd::siab_config']
  }
}

