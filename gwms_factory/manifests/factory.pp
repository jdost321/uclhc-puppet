class gwms_factory::factory (
    $osg_release = '3.3',
    $condor_version = 'latest',
    $gwms_version = 'latest',
    $factory_name = '',
    $factory_type = '',
    $GLIDEIN_REQUIRED_OS = 'rhel6',
    $frontend_list = [],
    $frontends = [],
    $tarball_src = 'http://gfactory-1.t2.ucsd.edu/debug/tarballs',
    $tarball_list = [],
    $tarballs = []
  ) {
  include gwms_factory::factory::osg_repos
  include gwms_factory::factory::grid_certs
  include gwms_factory::factory::condor
  include gwms_factory::factory::entry_repo

  user { $gwms_factory::factory::frontend_list:
    ensure => present,
    managehome => true
  }

  package { 'glideinwms-factory':
    ensure => $gwms_factory::factory::gwms_version,
    provider => 'yum',
    require => Class['gwms_factory::factory::condor']
  }

  service { 'httpd':
    enable => 'true',
    ensure => 'running',
    require => Package['glideinwms-factory']
  }

  file { '/etc/gwms-factory/glideinWMS.xml':
    ensure => 'present',
    content => template('gwms_factory/factory/glideinWMS.xml.erb'),
    require => Package['glideinwms-factory']
  }

  file { '/usr/local/bin/fetch_and_strip_tarball.sh':
    ensure => 'present',
    source => 'puppet:///modules/gwms_factory/factory/fetch_and_strip_tarball.sh',
    mode => '0755'
  }

  define glidein_tarball {
    exec { "/usr/local/bin/fetch_and_strip_tarball.sh ${gwms_factory::factory::tarball_src} ${title}":
      creates => "/var/lib/gwms-factory/condor/${title}",
      require => File['/usr/local/bin/fetch_and_strip_tarball.sh']
    }
  }

  glidein_tarball { $gwms_factory::factory::tarball_list:
    subscribe => Package['glideinwms-factory']
  }
}
