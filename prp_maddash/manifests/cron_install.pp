class prp_maddash::cron_install {
  $cron_load_cmd = $prp_maddash::enable_cron ? {
    true => '/usr/local/bin/cron-load-gridftp.sh',
    false => '/usr/local/bin/cron-load-gridftp.sh disable'
  }

  file { '/usr/local/bin/timeout.sh':
    ensure => 'present',
    source  => 'puppet:///modules/prp_maddash/timeout.sh',
    mode => '0755'
  }
  file { '/usr/local/bin/custom.sh':
    ensure => 'present',
    content => template('prp_maddash/custom.sh.erb')
    mode => '0644'
  }
  file { '/usr/local/bin/cron-load-gridftp.sh':
    ensure => 'present',
    source  => 'puppet:///modules/prp_maddash/cron-load-gridftp.sh',
    mode => '0755'
  } ->
  exec { '/usr/local/bin/cron-load-gridftp.sh':
    command => $cron_load_cmd,
    creates => '/etc/cron.d/cron-gridftp-transfer-mesh',
    require => Class['prp_maddash::esmond_client']
  }
}
