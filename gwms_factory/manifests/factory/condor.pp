class gwms_factory::factory::condor {
  require gwms_factory::factory::osg_repos

  package { 'condor':
    ensure => $gwms_factory::factory::condor_version,
    provider => 'yum'
  }
  package { 'condor-cream-gahp':
    ensure => $gwms_factory::factory::condor_version,
    provider => 'yum'
  }
  package { 'condor-python':
    ensure => $gwms_factory::factory::condor_version,
    provider => 'yum'
  }

  include gwms_factory::factory::condor::gwms_config
  include gwms_factory::factory::condor::auth_config
}
