class condor ($condor_version = 'latest', $gwms_version = 'latest', $submit_site_attr = '') {
  require osg_repos

  package { 'condor':
    ensure => $condor_version,
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  } ->
  package { 'glideinwms-userschedd':
    ensure => $gwms_version,
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }

  file {'/etc/condor/certs/condor_mapfile':
    ensure => 'present',
    source => 'puppet:///modules/condor/condor_mapfile',
    require => Package['condor']
  }
  file {'/etc/condor/config.d/90_gwms_dns.config':
    ensure => 'present',
    source => 'puppet:///modules/condor/90_gwms_dns.config',
    require => Package['condor']
  }
  file {'/etc/condor/config.d/91_single_host.config':
    ensure => 'present',
    source => 'puppet:///modules/condor/91_single_host.config',
    require => Package['condor']
  }
  file {'/etc/condor/config.d/92_uclhc_flock_to.config':
    ensure => 'present',
    source => 'puppet:///modules/condor/92_uclhc_flock_to.config',
    require => Package['condor']
  }
  file {'/etc/condor/config.d/95_submit_tweaks.config':
    ensure => 'present',
    content => template('condor/95_submit_tweaks.config.erb'),
    require => Package['condor']
  }

  service { 'condor':
    enable => 'true',
    ensure => 'running',
    require => Package['condor'],
    subscribe => [
      Package['glideinwms-userschedd'],
      File['/etc/condor/certs/condor_mapfile',
        '/etc/condor/config.d/90_gwms_dns.config',
        '/etc/condor/config.d/91_single_host.config',
        '/etc/condor/config.d/92_uclhc_flock_to.config',
        '/etc/condor/config.d/95_submit_tweaks.config'
      ]]
  }
}
