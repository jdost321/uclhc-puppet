class xrootd ($xrootd_version = 'latest') {
  require osg_repos

  package { 'xrootd':
    ensure => $xrootd_version,
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }
}
