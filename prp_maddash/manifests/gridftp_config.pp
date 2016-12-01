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
  } ->
  exec { 'get_data_file':
    environment => [ "GLOBUS_TCP_PORT_RANGE=50000,51000" ],
    command => '/usr/bin/globus-url-copy -vb -fast -p 16 ftp://ps-40g-gridftp.calit2.optiputer.net:2811/export/data/10G.dat file:///export/data/10G.dat',
    creates => '/export/data/10G.dat',
    require => Package['globus-gass-copy-progs']
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
