class osg_repos {
  package { 'epel-release':
    ensure => 'installed',
    provider => 'rpm',
    source => 'http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm'
  } ->
  ini_setting { 'disable_epel':
    path => '/etc/yum.repos.d/epel.repo',
    section => 'epel',
    setting => 'enabled',
    value => '0'
  } ->
  package { 'yum-plugin-priorities':
    ensure => 'latest',
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}]
  }

  package { 'osg-release':
    ensure => 'installed',
    provider => 'rpm',
    source => 'http://repo.grid.iu.edu/osg/3.2/osg-3.2-el6-release-latest.rpm'
  } ->
  ini_setting { 'disable_osg':
    path => '/etc/yum.repos.d/osg-el6.repo',
    section => 'osg',
    setting => 'enabled',
    value => '0'
  }
}
