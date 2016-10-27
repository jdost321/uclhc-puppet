class prp_maddash::esmond_client {
  package { 'centos-release-scl':
    ensure => 'latest',
    provider => 'yum'
  } ->
  package { 'python27':
    ensure => 'latest',
    provider => 'yum'
  } ->
  file { '/root/esmond-gridftp-install.sh':
    ensure => 'present',
    source  => 'puppet:///modules/prp_maddash/esmond-gridftp-install.sh',
    mode => '0755'
  } ->
  exec { '/root/esmond-gridftp-install.sh':
    creates => '/opt/esmond-gridftp/bin/esmond-ps-load-gridftp'
  }
}
