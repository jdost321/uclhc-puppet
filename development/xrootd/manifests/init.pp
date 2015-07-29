class xrootd ($xrootd_version = 'latest') {
  require osg_repos

  package { 'xrootd':
    ensure => $xrootd_version,
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }

  file { '/data/user/':
    ensure => 'directory',
    owner => 'xrootd',
    group => 'xrootd'
  }
  file_line { 'xrd_rdr_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'XROOTD_RDR_OPTIONS="-l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'xrd_srv_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'XROOTD_SRV_OPTIONS="-l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'cmsd_rdr_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'CMSD_RDR_OPTIONS="-l /var/log/xrootd/cmsd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'cmsd_srv_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'CMSD_SRV_OPTIONS="-l /var/log/xrootd/cmsd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'xrd_instances':
    path => '/etc/sysconfig/xrootd',
    line => 'XROOTD_INSTANCES="rdr srv"',
    match => '^XROOTD_INSTANCES=',
    require => Package['xrootd']
  }
  file_line { 'cmsd_instances':
    path => '/etc/sysconfig/xrootd',
    line => 'CMSD_INSTANCES="rdr srv"',
    match => '^CMSD_INSTANCES=',
    require => Package['xrootd']
  }

  file { '/etc/xrootd/xrootd-clustered.cfg':
    ensure => 'present',
    content => template('xrootd/xrootd-clustered.cfg.erb'),
    require => Package['xrootd']
  }

  service { 'xrootd':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => [File_line['xrd_instances','xrd_rdr_opt','xrd_srv_opt'],
      File['/etc/xrootd/xrootd-clustered.cfg']]
  }
  service { 'cmsd':
    enable => 'true',
    ensure => 'running',
    require => Package['xrootd'],
    subscribe => [File_line['cmsd_instances','cmsd_rdr_opt','cmsd_srv_opt'],
      File['/etc/xrootd/xrootd-clustered.cfg']]
  }
}
