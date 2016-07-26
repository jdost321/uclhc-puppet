class ucsd_repo {
  require osg_repos

  package { 'ucsdt2-repo':
    ensure => 'latest',
    provider => 'rpm',

    source => "http://www.t2.ucsd.edu/repo/el6/x86_64/ucsdt2-repo-1.0-4.el6.noarch.rpm"
  } ->
  ini_setting {'disable_release':
    ensure => present,
    path => '/etc/yum.repos.d/ucsdt2.repo',
    section => 'ucsdt2',
    setting => 'enabled',
    value => '0'
  } ->
  ini_setting {'enable_testing':
    ensure => present,
    path => '/etc/yum.repos.d/ucsdt2.repo',
    section => 'ucsdt2-testing',
    setting => 'enabled',
    value => '1'
  } ->
  # make it the same prio as osg
  ini_setting {'ucsdt2_prio':
    ensure => present,
    path => '/etc/yum.repos.d/ucsdt2.repo',
    section => 'ucsdt2-testing',
    setting => 'priority',
    value => '98'
  }
}
