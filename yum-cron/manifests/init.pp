class yum-cron {
  package { 'yum-cron':
    ensure => 'latest',
    provider => 'yum'
  } ->
  file { '/etc/sysconfig/yum-cron':
    ensure  => 'present',
    source  => 'puppet:///modules/yum-cron/yum-cron',
  } ~>
  service { 'yum-cron':
    enable => true,
    ensure => running,
  }
}
