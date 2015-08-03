class condor::batch_config {
  file { '/etc/condor/config.d/91_single_host.config':
    ensure  => 'present',
    source  => 'puppet:///modules/condor/91_single_host.config',
    require => Package['condor']
  }

  file {'prepare_xrootd_location':
    ensure  => 'present',
    source  => 'puppet:///modules/condor/prepare_xrootd_location',
    path    => '/usr/libexec/condor/prepare_xrootd_location',
    require => Package['condor'],
    mode    => '755'
  }

  file {'96_xrootd_env_tweaks.config':
    ensure  => 'present',
    source  => 'puppet:///modules/condor/96_xrootd_env_tweaks.config',
    path    => '/etc/condor/config.d/96_xrootd_env_tweaks.config',
    require => File['prepare_xrootd_location']
  }

  
}
