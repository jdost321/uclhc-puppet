class xrootd::siab_config {
  file { ['/data/uclhc', "/data/uclhc/${xrootd::xrd_dir}", "/data/uclhc/${xrootd::xrd_dir}/user"]:
    ensure => 'directory',
    owner => 'root',
    group => 'root'
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
}
