class condor::auth_config {
  $mapfile = $condor::flavor ? {
    'submit' => 'condor_mapfile.erb',
    'condor-c' => 'condor_mapfile.condor_c.erb',
    'uaf' => 'condor_mapfile.uaf.erb',
  }

  file { '/etc/condor/certs/condor_mapfile':
    ensure => 'present',
    content => template("condor/$mapfile"),
    require => Package['condor']
  }
} 
