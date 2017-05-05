class uclhc_admin (
    $rootpubkeys = 'root.ssh',
    $uclhcprofile =  'uclhc.sh'
  ) {

  file { "/root/.ssh":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => '0700'
  } ->
  file { "/root/.ssh/authorized_keys":
    ensure => "present",
    source => "puppet:///modules/uclhc_admin/$rootpubkeys",
    mode => '0600',
    owner  => "root",
    group  => "root"
  }
      
  file { "/etc/profile.d/uclhc.sh":
    ensure => "present",
    source => "puppet:///modules/uclhc_admin/$uclhcprofile"
  }
}
