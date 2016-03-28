class condor::batch_config {
  file { '/etc/condor/config.d/91_single_host.config':
    ensure  => 'present',
    content => template('condor/91_single_host.config.erb'),
    require => Package['condor']
  }

  file {'prepare_xrootd_location':
    ensure  => 'present',
    source  => 'puppet:///modules/condor/prepare_xrootd_location',
    path    => '/usr/libexec/condor/prepare_xrootd_location',
    require => Package['condor'],
    mode    => '755'
  }

  file {'90_ganglia_tweaks.config':
    content => template('condor/90_ganglia_tweaks.config.erb'),
    require => Package['condor'],
    ensure  => 'present',
    path    => '/etc/condor/config.d/90_ganglia_tweaks.config',
  }

  file {'96_xrootd_env_tweaks.config':
    ensure  => 'present',
    source  => 'puppet:///modules/condor/96_xrootd_env_tweaks.config',
    path    => '/etc/condor/config.d/96_xrootd_env_tweaks.config',
    require => File['prepare_xrootd_location']
  }

  
}
