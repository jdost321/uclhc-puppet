class uclhc {
  $uclhc = hiera('uclhc')
  $rootpubkeys = hiera('rootpubkeys')
  $uclhcprofile =  hiera('uclhcprofile')
  
  file { "/root/.ssh":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => 700,
    } ->
    file { "/root/.ssh/authorized_keys":
      ensure => "present",
      source => "$rootpubkeys",
      mode => 600,
      owner  => "root",
      group  => "root",
    }
      
    
    file { "/etc/profile.d/uclhc.sh":
      ensure => "present",
      source => [
                 "$uclhcprofile",
                 ],
    }
    
      
}
  
