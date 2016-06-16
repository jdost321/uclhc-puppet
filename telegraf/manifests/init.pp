#telegraf/manifests/init.pp
# == Class: telegraf
#
#
# This module manages telegraf

class telegraf()
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
    source => 'puppet:///modules/telegraf/uclhc.conf',
  }
  
}
