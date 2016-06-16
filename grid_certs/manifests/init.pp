class grid_certs {
  require osg_repos

  package { 'osg-ca-certs':
    ensure => 'latest',
    provider => 'yum'
  }
  package { 'fetch-crl':
    ensure => 'latest',
    provider => 'yum'
  }

  service { 'fetch-crl-boot':
    enable => false,
    ensure => stopped,
    require => [Package['osg-ca-certs'], Package['fetch-crl']]
  }
  service { 'fetch-crl-cron':
    enable => true,
    ensure => running,
    require => [Package['osg-ca-certs'], Package['fetch-crl']]
  }
}
