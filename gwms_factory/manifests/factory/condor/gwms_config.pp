class gwms_factory::factory::condor::gwms_config {
  require gwms_factory::factory::osg_repos

  package { 'glideinwms-factory-condor':
    ensure => $gwms_factory::factory::gwms_version,
    provider => 'yum',
    require => Package['condor']
  }
  file { '/etc/condor/config.d/02_gwms_factory_schedds.config':
    ensure => 'present',
    source => 'puppet:///modules/gwms_factory/factory/condor/02_gwms_factory_schedds.config',
    require => Package['glideinwms-factory-condor']
  }
  file { '/etc/condor/config.d/11_gwms_factory_secondary_schedds.config':
    ensure => 'present',
    source => 'puppet:///modules/gwms_factory/factory/condor/11_gwms_factory_secondary_schedds.config',
    require => Package['condor']
  }
}
