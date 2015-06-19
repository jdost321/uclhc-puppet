# == Class: frontier-squid::config
#
# This module manages the basic configuration for the frontier-squid
#
class frontier-squid::config ()
{

  file { 'customize.sh':
        ensure => present,
        path   => '/etc/squid/customize.sh',
        owner  => 'squid',
        source => 'puppet:///modules/frontier-squid/customize.sh',
        group  => 'squid',
        mode   => 0755
  }
  file {'squid.conf':
    ensure => present,
    path   => '/etc/squid/squid.conf',
    owner  => 'squid',
    group  => 'squid',
    mode   => 0444
  }
  exec { 'customize.sh':
        command => '/etc/squid/customize.sh',
        path    => ["/usr/bin", "/usr/sbin"]
      }

  exec { 'reload':
    command => 'service frontier-squid reload',
    path    => ["/usr/bin", "/usr/sbin", "/sbin"]
  }

  service { 'frontier-squid':
     ensure     => running,
     name       => "frontier-squid",
     enable     => true,
     hasrestart => true
   }
             
  File['customize.sh']  -> File['squid.conf']
  File['customize.sh']  ~> Exec['customize.sh']
  Exec ['customize.sh'] ~> Exec['reload']
  Service['frontier-squid'] -> Exec['reload']
  
}
