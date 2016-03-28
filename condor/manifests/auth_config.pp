class condor::auth_config {
  /*$mapfile = $condor::enable_condor_c ? {
    true => 'condor_mapfile.condor_c.erb',
    false => 'condor_mapfile.erb'
  }
  */

  $mapfile = 'condor_mapfile.erb'

  file { '/etc/condor/certs/condor_mapfile':
    ensure => 'present',
    content => template("condor/$mapfile"),
    require => Package['condor']
  }
} 
