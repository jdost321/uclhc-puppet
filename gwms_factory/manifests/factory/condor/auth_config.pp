class gwms_factory::factory::condor::auth_config {
  require gwms_factory::factory::condor::gwms_config

  file { '/etc/condor/certs/condor_mapfile':
    ensure => 'present',
    content => template('gwms_factory/factory/condor/condor_mapfile.erb'),
  }
}
