class xrootd::grid_proxy {
  require client_tools

  $cron_ensure = $xrootd::update_proxy ? {
    true => 'present',
    false => 'absent'
  }

  file { '/usr/local/sbin/refresh_proxy':
    ensure => 'present',
    source  => 'puppet:///modules/xrootd/refresh_proxy',
    mode => '0755'
  }
  file { '/etc/cron.d/refresh_proxy.cron':
    ensure => $cron_ensure,
    source  => 'puppet:///modules/xrootd/refresh_proxy.cron',
  }
}
