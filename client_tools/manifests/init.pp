class client_tools {
  require osg_repos

  package { 'vo-client':
    ensure          => 'latest',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }
  package { 'voms-clients':
    ensure          => 'latest',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }

  package { 'git':
    ensure          => 'present',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}]
  }

  package { 'subversion':
    ensure          => 'present',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}]
  }
}
