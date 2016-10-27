class prp_maddash (
    $disable_cron = true
  ) {
  require osg_repos

  package { 'globus-gridftp-server-progs':
    ensure => 'latest',
    provider => 'yum'
  }

  package { 'globus-gass-copy-progs':
    ensure => 'latest',
    provider => 'yum'
  }

  include prp_maddash::esmond_client
  include prp_maddash::cron_install
  include prp_maddash::gridftp_config

  service { 'globus-gridftp-server':
    enable => 'true',
    ensure => 'running',
    require => Package['globus-gridftp-server-progs'],
    subscribe => Class['prp_maddash::gridftp_config']
  }
}
