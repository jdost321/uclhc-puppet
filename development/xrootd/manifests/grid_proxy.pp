class xrootd::grid_proxy {
  require client_tools

  file { '/usr/local/sbin/refresh_proxy':
    ensure => 'present',
    source  => 'puppet:///modules/xrootd/refresh_proxy',
    mode => '0755'
  }

  $atlas_arg = $xrootd::disable_atlas_proxy ? {
    true => '',
    false => 'atlas'
  }
  $cms_arg = $xrootd::disable_cms_proxy ? {
    true => '',
    false => 'cms'
  }
  $refresh_args = join([$atlas_arg,$cms_arg], ' ')

  $cron_content = $xrootd::update_proxy ? {  
    true => "39 3,9,15,21 * * * root /usr/local/sbin/refresh_proxy $refresh_args > /dev/null 2>&1\n",
    false => "#39 3,9,15,21 * * * root /usr/local/sbin/refresh_proxy $refresh_args > /dev/null 2>&1\n"
  }

  file { '/etc/cron.d/refresh_proxy.cron':
    ensure => 'present',
    content => $cron_content
  }
}
