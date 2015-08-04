class xrootd ($xrootd_version = 'latest') {
  require osg_repos

  package { 'xrootd':
    ensure => $xrootd_version,
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }
  package { 'xrootd-client':
    ensure => $xrootd_version,
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }

  include xrootd::base_config
  include xrootd::cluster_config
  include xrootd::proxy_config

  service { 'xrootd':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => Class['xrootd::base_config', 'xrootd::cluster_config', 'xrootd::proxy_config']
  }
  service { 'cmsd':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => Class['xrootd::base_config', 'xrootd::cluster_config']
  }
}
