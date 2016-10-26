class prp_maddash::gridftp_config {
  user { 'gridftp_user':
    ensure => 'present',
    name => 'gridftp'
  }

  file { '/data/esmond-gridftp':
    ensure => 'directory',
    owner => 'root',
    group => 'root'
  } ->
  file { '/export':
    ensure => 'directory',
    owner => 'root',
    group => 'root'
  } ->
  file { '/export/data':
    ensure => 'link',
    target => '/data/esmond-gridftp',
    owner => 'root',
    group => 'root'
  }

  file { '/etc/sysconfig/globus-gridftp-server':
    ensure => 'present',
    source  => 'puppet:///modules/prp_maddash/globus-gridftp-server',
    require => Package['globus-gridftp-server-progs']
  }

  file { '/etc/gridftp.conf':
    ensure => 'present',
    source  => 'puppet:///modules/prp_maddash/gridftp.conf',
    require => Package['globus-gridftp-server-progs']
  }
}
