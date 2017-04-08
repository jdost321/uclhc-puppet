class gwms_factory::factory (
    $osg_release = '3.3',
    $condor_version = 'latest',
    $gwms_version = 'latest',
    $factory_name = '',
    $factory_type = '',
    $GLIDEIN_REQUIRED_OS = 'rhel6',
    $frontends = [],
    $tarballs = []
  ) {
  include gwms_factory::factory::osg_repos
  include gwms_factory::factory::grid_certs
  include gwms_factory::factory::condor

  package { 'glideinwms-factory':
    ensure => $gwms_factory::factory::gwms_version,
    provider => 'yum',
    require => Class['gwms_factory::factory::condor']
  }

  file { '/etc/gwms-factory/glideinWMS.xml':
    ensure => 'present',
    content => template('gwms_factory/factory/glideinWMS.xml.erb'),
    require => Package['glideinwms-factory']
  }
}
