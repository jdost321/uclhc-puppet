class gwms_factory::factory::condor::auth_config {
  require gwms_factory::factory::condor::gwms_config

  file { '/etc/condor/certs/condor_mapfile':
    ensure => 'present',
    content => template('gwms_factory/factory/condor/condor_mapfile.erb')
  }
  file { '/etc/condor/privsep_config':
    ensure => 'present',
    content => template('gwms_factory/factory/condor/privsep_config.erb')
  }
  file { '/etc/condor/config.d/90_gwms_dns.config':
    ensure => 'present',
    content => template('gwms_factory/factory/condor/90_gwms_dns.config.erb')
  }
}
