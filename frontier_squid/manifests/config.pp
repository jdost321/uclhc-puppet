# == Class: frontier_squid::config
#
# This module manages the basic configuration for the frontier-squid
#
class frontier_squid::config (
    $acl_NET_LOCAL_src = '10.0.0.0/8 172.16.0.0/12 192.168.0.0/16',
)
{

  file { 'customize.sh':
        ensure => present,
        path   => '/etc/squid/customize.sh',
        owner  => 'squid',
        content => template('frontier_squid/customize.sh.erb'),
        group  => 'squid',
        mode   => '0755'
  }
  file {'squid.conf':
    ensure => present,
    path   => '/etc/squid/squid.conf',
    owner  => 'squid',
    group  => 'squid',
    mode   => '0444'
  }
  exec { 'customize.sh':
        command => '/etc/squid/customize.sh',
        path    => ["/usr/bin", "/usr/sbin"],
        refreshonly => true,
      }

  exec { 'reload':
    command => 'service frontier-squid reload',
    path    => ["/usr/bin", "/usr/sbin", "/sbin"],
    refreshonly => true,
  }

  service { 'frontier-squid':
     ensure     => running,
     name       => "frontier-squid",
     enable     => true,
     hasrestart => true
   }
             
  File['customize.sh']  -> File['squid.conf']
  File['customize.sh']  ~> Exec['customize.sh']
  Exec['customize.sh'] ~> Exec['reload']
  Service['frontier-squid'] -> Exec['reload']
  
}
