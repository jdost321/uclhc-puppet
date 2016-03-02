class condor::condor_c_config {
  file { '/etc/condor/config.d/93_condor_c.config':
    ensure  => 'present',
    content => template('condor/93_condor_c.config.erb'),
    require => Package['condor'],
    notify => Service['condor']
  }
}
