class xrootd (
    $xrootd_version = 'latest',
    $xrd_port = '1094',
    $meta_cmsd_port = '3121',
    $xrd_dir = $fqdn,
    $update_proxy = true
  ) {
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
  include xrootd::grid_proxy

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
