class client_tools {
  require osg_repos

  package { 'vo-client':
    ensure          => 'latest',
    provider        => 'yum'
  }
  package { 'voms-clients-cpp':
    ensure          => 'latest',
    provider        => 'yum'
  }

  package { 'git':
    ensure          => 'latest',
    provider        => 'yum'
  }

  package { 'subversion':
    ensure          => 'latest',
    provider        => 'yum'
  }

  package { 'screen':
    ensure          => 'latest',
    provider        => 'yum'
  }

  package { 'tmux':
    ensure          => 'latest',
    provider        => 'yum'
  }
  package { 'gcc':
    ensure          => 'latest',
    provider        => 'yum'
  }
  package { 'libxml2-devel':
    ensure          => 'latest',
    provider        => 'yum'
  }
  package { 'boost-devel':
    ensure          => 'latest',
    provider        => 'yum'
  }
}
