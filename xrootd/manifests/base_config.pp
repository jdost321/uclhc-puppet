class xrootd::base_config {
  file {'sysconfig-xrootd':
 	path => '/etc/sysconfig/xrootd',
	owner => 'root',
	group => 'root',
	mode => '0644',
	source => 'puppet:///modules/xrootd/xrootd',
  }
  file_line { 'xrd_rdr_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'XROOTD_RDR_OPTIONS="-l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'xrd_srv_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'XROOTD_SRV_OPTIONS="-l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'xrd_atlas_proxy_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'XROOTD_ATLAS_PROXY_OPTIONS="-l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-proxy.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'xrd_cms_proxy_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'XROOTD_CMS_PROXY_OPTIONS="-l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-proxy.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'cmsd_rdr_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'CMSD_RDR_OPTIONS="-l /var/log/xrootd/cmsd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo"',
    require => Package['xrootd']
  }
  file_line { 'cmsd_srv_opt':
    path => '/etc/sysconfig/xrootd',
    line => 'CMSD_SRV_OPTIONS="-l /var/log/xrootd/cmsd.log -c /etc/xrootd/xrootd-clustered.cfg -k fifo"',
    require => Package['xrootd']
  }

  $atlas_proxy_name = $xrootd::disable_atlas_proxy ? {
    true => '',
    false => 'atlas_proxy'
  }
  $cms_proxy_name = $xrootd::disable_cms_proxy ? {
    true => '',
    false => 'cms_proxy'
  }
  $xrd_instances = join(['rdr','srv',$atlas_proxy_name,$cms_proxy_name], ' ')

  file_line { 'xrd_instances':
    path => '/etc/sysconfig/xrootd',
    line => "XROOTD_INSTANCES=\"${xrd_instances}\"",
    match => '^XROOTD_INSTANCES=',
    require => Package['xrootd']
  }
  file_line { 'cmsd_instances':
    path => '/etc/sysconfig/xrootd',
    line => 'CMSD_INSTANCES="rdr srv"',
    match => '^CMSD_INSTANCES=',
    require => Package['xrootd']
  }
}
