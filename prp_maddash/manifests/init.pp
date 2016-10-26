class prp_maddash {
  require osg_repos

  package { 'globus-gridftp-server-progs':
    ensure => 'latest',
    provider => 'yum'
  }

  package { 'globus-gass-copy-progs':
    ensure => 'latest',
    provider => 'yum'
  }

  package { 'centos-release-scl':
    ensure => 'latest',
    provider => 'yum'
  } ->
  package { 'python27':
    ensure => 'latest',
    provider => 'yum'
  }

  include prp_maddash::gridftp_config

  service { 'globus-gridftp-server':
    enable => 'true',
    ensure => 'running',
    require => Package['globus-gridftp-server-progs'],
    subscribe => Class['prp_maddash::gridftp_config']
  }
}
