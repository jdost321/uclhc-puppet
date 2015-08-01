class condor::batch_config {
  file { '/etc/condor/config.d/91_single_host.config':
    ensure => 'present',
    source => 'puppet:///modules/condor/91_single_host.config',
    require => Package['condor']
  }
}
