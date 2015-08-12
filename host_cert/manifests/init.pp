class host_cert ($host = $fqdn) {
  file { '/etc/grid-security':
    ensure => 'directory',
    owner => 'root',
    group => 'root',
    mode => '0755'
  }
  file { '/etc/grid-security/hostcert.pem':
    ensure => 'present',
    source => "puppet:///modules/host_cert/${host}-hostcert.pem",
    owner => 'root',
    group => 'root',
    mode => '0644',
    require =>  File['/etc/grid-security']
  }
  file { '/etc/grid-security/hostkey.pem':
    ensure => 'present',
    source => "puppet:///modules/host_cert/${host}-hostkey.pem",
    owner => 'root',
    group => 'root',
    mode => '0600',
    require =>  File['/etc/grid-security']
  }
}
