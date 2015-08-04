class xrootd::proxy_config {
  file { '/data/cache/':
    ensure => 'directory',
    owner => 'xrootd',
    group => 'xrootd'
  }

  file { '/etc/xrootd/xrootd-proxy.cfg':
    ensure => 'present',
    source  => 'puppet:///modules/xrootd/xrootd-proxy.cfg',
    require => Package['xrootd']
  }
}
