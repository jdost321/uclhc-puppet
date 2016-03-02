class condor::gwms_config {
  require osg_repos

  package { 'glideinwms-userschedd':
    ensure => $condor::gwms_version,
    provider => 'yum',
    require => Package['condor']
  }
  file { '/etc/condor/config.d/90_gwms_dns.config':
    ensure => 'present',
    source => 'puppet:///modules/condor/90_gwms_dns.config',
    require => Package['condor']
  }
  file { '/etc/condor/config.d/92_uclhc_flock_to.config':
    ensure => 'present',
    source => 'puppet:///modules/condor/92_uclhc_flock_to.config',
    require => Package['condor']
  }
  file { '/etc/condor/config.d/95_submit_tweaks.config':
    ensure => 'present',
    content => template('condor/95_submit_tweaks.config.erb'),
    require => Package['condor']
  }
}
