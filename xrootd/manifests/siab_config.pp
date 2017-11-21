class xrootd::siab_config {
  file { ['/data/uclhc', "/data/uclhc/${xrootd::xrd_dir}", "/data/uclhc/${xrootd::xrd_dir}/user"]:
    ensure => 'directory',
    owner => 'root',
    group => 'root'
  }

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

  file { '/etc/xrootd/xrootd-siab-redirector.cfg':
    ensure => 'present',
    content => template('xrootd/xrootd-siab-redirector.cfg.erb'),
    require => Package['xrootd']
  }
  file { '/etc/xrootd/xrootd-siab-server.cfg':
    ensure => 'present',
    content => template('xrootd/xrootd-siab-server.cfg.erb'),
    require => Package['xrootd']
   }
  file { '/etc/xrootd/xrootd-siab-atlas-proxy.cfg':
    ensure => 'present',
    source  => 'puppet:///modules/xrootd/xrootd-siab-atlas-proxy.cfg',
    require => Package['xrootd']
  }
  file { '/etc/xrootd/xrootd-siab-cms-proxy.cfg':
    ensure => 'present',
    source  => 'puppet:///modules/xrootd/xrootd-siab-cms-proxy.cfg',
    require => Package['xrootd']
  }
}
