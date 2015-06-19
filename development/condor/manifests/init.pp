class condor {
  require osg_repos

  package { 'condor':
    ensure => 'latest',
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  } ->
  package { 'glideinwms-userschedd':
    ensure => 'latest',
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }

  file {'/etc/condor/config.d/91_single_host.config':
    ensure => 'present',
    source => 'puppet:///modules/condor/91_single_host.config',
    require => Package['condor']
  }

  service { 'condor':
    enable => 'true',
    ensure => 'running',
    require => Package['condor'],
    subscribe => [Package['glideinwms-userschedd'], File['/etc/condor/config.d/91_single_host.config']]
  }
}
