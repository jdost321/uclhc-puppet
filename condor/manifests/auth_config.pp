class condor::auth_config {
  $mapfile = $condor::flavor ? {
    'condor-c' => 'condor_mapfile.condor_c.erb',
    'uaf' => 'condor_mapfile.uaf.erb',
    default => 'condor_mapfile.erb',
  }

  file { '/etc/condor/certs/condor_mapfile':
    ensure => 'present',
    content => template("condor/$mapfile"),
    require => Package['condor']
  }
} 
