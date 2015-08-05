class xrootd::grid_proxy {
  require client_tools

  file { '/usr/local/sbin/refresh_proxy':
    ensure => 'present',
    source  => 'puppet:///modules/xrootd/refresh_proxy',
    mode => '0755'
  }
  file { '/etc/cron.d/refresh_proxy.cron':
    ensure => 'present',
    source  => 'puppet:///modules/xrootd/refresh_proxy.cron',
  }
}
