class yum-cron {
  package { 'yum-cron':
    ensure => 'latest',
    provider => 'yum'
  }

  file { '/etc/sysconfig/yum-cron':
    ensure  => 'present',
    source  => 'puppet:///modules/yum-cron/yum-cron',
    require => Package['yum-cron'],
    notify => Service['yum-cron']
  }

  file { '/etc/yum/yum-cron.conf':
    ensure  => 'present',
    source  => 'puppet:///modules/yum-cron/yum-cron.conf',
    require => Package['yum-cron'],
    notify => Service['yum-cron']
  }

  service { 'yum-cron':
    enable => true,
    ensure => running
  }
}
