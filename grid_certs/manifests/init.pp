class grid_certs {
  require osg_repos

  package { 'osg-ca-certs':
    ensure => 'latest',
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }
  package { 'fetch-crl':
    ensure => 'latest',
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }

  service { 'fetch-crl-boot':
    enable => true,
    ensure => running,
    require => [Package['osg-ca-certs'], Package['fetch-crl']]
  }
  service { 'fetch-crl-cron':
    enable => true,
    ensure => running,
    require => [Package['osg-ca-certs'], Package['fetch-crl']]
  }
}
