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
  if ($condor::flavor != 'uaf') and ($condor::flavor != 'transfer') {
    file { '/etc/condor/config.d/92_uclhc_flock_to.config':
      ensure => 'present',
      source => 'puppet:///modules/condor/92_uclhc_flock_to.config',
      require => Package['condor']
    }
  }
  $local_tweaks = $condor::flavor ? {
    'uaf' => '95_submit_tweaks.config.uaf.erb',
    'transfer' => '95_submit_tweaks.config.transfer.erb',
    default => '95_submit_tweaks.config.erb'
  }
  file { '/etc/condor/config.d/95_submit_tweaks.config':
    ensure => 'present',
    content => template("condor/${local_tweaks}"),
    require => Package['condor']
  }
}
