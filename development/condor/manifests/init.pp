class condor ($condor_version = 'latest', $gwms_version = 'latest', $submit_site_name = '') {
  require osg_repos

  package { 'condor':
    ensure => $condor_version,
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }

  include condor::gwms_config
  include condor::batch_config

  service { 'condor':
    enable => 'true',
    ensure => 'running',
    require => Package['condor'],
    subscribe => Class['condor::gwms_config', 'condor::batch_config']
  }
}
