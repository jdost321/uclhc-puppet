#telegraf/manifests/init.pp
# == Class: telegraf
#
#
# This module manages telegraf

class telegraf(
  $influxdb_host = 'condorflux.t2.ucsd.edu',
  $influxdb_port = '8086',
  $database      = 'telegraf',
  $username      = 'telegraf',
  $password      = 'mypassword',
)
{

  file {'influxdb.repo':
    path   => '/etc/yum.repos.d/influxdb.repo',
    ensure => 'present',
    source => 'puppet:///modules/telegraf/influxdb.repo',
   }

   package{'telegraf':
           ensure   => 'installed',
           provider => 'yum',
           name     => "telegraf",
  }
  
  File['influxdb.repo'] -> Package['telegraf']
  Package['telegraf'] -> Service['telegraf']

  service {'telegraf':
           ensure    => 'running',
           enable    => true,
           subscribe => File['uclhc-telegraf.conf']
  }

  file {'uclhc-telegraf.conf':
    path   => '/etc/telegraf/telegraf.d/uclhc-telegraf.conf',
    ensure => 'present',
    content => template('telegraf/uclhc.conf.erb')
    #source => 'puppet:///modules/telegraf/uclhc.conf',
  }
  
}
