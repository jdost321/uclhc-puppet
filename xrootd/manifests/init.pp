class xrootd (
    $xrootd_version = 'latest',
    $vo = 'atlas',
    $xrd_port = '1094',
    $meta_cmsd_port = '3121',
    $xrd_dir = $fqdn,
    $update_proxy = true,
    $disable_atlas_proxy = false,
    $disable_cms_proxy = false
  ) {
  require osg_repos
  require client_tools

  package { 'xrootd':
    ensure => $xrootd_version,
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }
  package { 'xrootd-voms-plugin':
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
  include xrootd::service_cert
  include xrootd::user_enviroment

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
