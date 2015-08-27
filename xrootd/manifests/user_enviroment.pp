class xrootd::user_enviroment {
    require client_tools

    file { '/etc/profile.d/xrootd_cache_location.sh':
          ensure => 'present',
          source  => 'puppet:///modules/xrootd/xrootd_cache_location.sh',
          #mode => '0755'
        }

    file { '/etc/profile.d/xrootd_cache_location.csh':
          ensure => 'present',
          source  => 'puppet:///modules/xrootd/xrootd_cache_location.csh',
          #mode => '0755'
       }
}
