class xrootd::basic_server {
  service { 'xrootd':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd', 'xrootd-voms-plugin'],
    subscribe => Class['xrootd::base_config', 'xrootd::cluster_config', 'xrootd::proxy_config', 'xrootd::service_cert']
  }
  service { 'cmsd':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => Class['xrootd::base_config', 'xrootd::cluster_config']
  }
}
