class gwms_factory::factory::condor::gwms_config {
  require gwms_factory::factory::osg_repos

  package { 'glideinwms-factory-condor':
    ensure => $gwms_factory::factory::gwms_version,
    provider => 'yum',
    require => Package['condor']
  }
  file { '/etc/condor/config.d/02_gwms_factory_schedds.config':
    ensure => 'present',
    source => 'puppet:///modules/gwms_factory/factory/condor/02_gwms_factory_schedds.config',
    require => Package['glideinwms-factory-condor']
  }
  file { '/etc/condor/config.d/11_gwms_factory_secondary_schedds.config':
    ensure => 'present',
    source => 'puppet:///modules/gwms_factory/factory/condor/11_gwms_factory_secondary_schedds.config',
    require => Package['condor']
  }

  define condor_dirs {
    file { [ "/var/lib/condor/${title}",
        "/var/lib/condor/${title}/execute",
        "/var/lib/condor/${title}/lock",
        "/var/lib/condor/${title}/procd_pipe",
        "/var/lib/condor/${title}/spool" ]:
      ensure => directory,
      owner => 'condor',
      group => 'condor',
      mode => '0755'
    }
  }

  condor_dirs { [ 'schedd_glideins1', 'schedd_glideins2', 'schedd_glideins3', 'schedd_glideins4',
      'schedd_glideins5', 'schedd_glideins6', 'schedd_glideins7', 'schedd_glideins8', 'schedd_glideins9' ]: 
    require => Package['condor']
  }
}
