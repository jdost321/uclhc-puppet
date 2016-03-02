class xrootd::proxy_config {
  file { ['/data/cache/']:
    ensure => 'directory',
    owner => 'root',
    group => 'root'
  } ->
  file { ['/data/cache/atlas','/data/cache/cms']:
    ensure => 'directory',
    owner => 'xrootd',
    group => 'xrootd',
    mode => '0700',
    require => Package['xrootd']
  }

  file { '/etc/xrootd/xrootd-proxy.cfg':
    ensure => 'present',
    source  => 'puppet:///modules/xrootd/xrootd-proxy.cfg',
    require => Package['xrootd']
  }
}
