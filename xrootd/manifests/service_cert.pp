class xrootd::service_cert {
  require host_cert

  file { ['/etc/grid-security/xrd']:
    ensure => 'directory',
    owner => 'xrootd',
    group => 'xrootd',
    require => Package['xrootd']
  } ->
  exec { 'copy_cert':
    command => '/bin/cp /etc/grid-security/hostcert.pem /etc/grid-security/xrd/xrdcert.pem && chown xrootd:xrootd /etc/grid-security/xrd/xrdcert.pem',
    creates => '/etc/grid-security/xrd/xrdcert.pem'
  } ->
  exec { 'copy_key':
    command => '/bin/cp /etc/grid-security/hostkey.pem /etc/grid-security/xrd/xrdkey.pem && chown xrootd:xrootd /etc/grid-security/xrd/xrdkey.pem',
    creates => '/etc/grid-security/xrd/xrdkey.pem'
  }
}
