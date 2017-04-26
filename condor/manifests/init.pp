class condor ($condor_version = 'latest',
              $gwms_version = 'latest',
              $submit_site_name = '',
              $ganglia_server = 'uclhc-fe-1.t2.ucsd.edu',
              $flavor = 'submit',
              $vo = 'atlas')
{
  require osg_repos

  package { 'condor':
    ensure => $condor_version,
    provider => 'yum'
  }

  include condor::auth_config
  include condor::gwms_config
  include condor::batch_config

  if $flavor == 'condor-c' {
    include condor::condor_c_config
  }

  service { 'condor':
    enable => 'true',
    ensure => 'running',
    require => Package['condor'],
    subscribe => Class['condor::auth_config', 'condor::gwms_config', 'condor::batch_config']
  }
}
