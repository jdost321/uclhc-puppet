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
    ensure          => 'latest',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}]
  }

  package { 'subversion':
    ensure          => 'latest',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}]
  }

  package { 'screen':
    ensure          => 'latest',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}]
  }

  package { 'tmux':
    ensure          => 'latest',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}]
  }
  package { 'gcc':
    ensure          => 'latest',
    provider        => 'yum',
    install_options => [{'--enablerepo' => 'epel'}]
  }
}
