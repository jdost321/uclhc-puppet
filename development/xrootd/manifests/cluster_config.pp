class xrootd::cluster_config {
  file { '/data/user/':
    ensure => 'directory',
    owner => 'xrootd',
    group => 'xrootd'
  }

  file { '/etc/xrootd/xrootd-clustered.cfg':
    ensure => 'present',
    content => template('xrootd/xrootd-clustered.cfg.erb'),
    require => Package['xrootd']
  }
}
