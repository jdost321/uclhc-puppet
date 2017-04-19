class gwms_factory::factory::entry_repo {
  # should ensure git installed first
  vcsrepo { '/etc/osg-gfactory':
    ensure => present,
    provider => git,
    #source => 'git@github.com:opensciencegrid/osg-gfactory.git'
    source => 'https://github.com/opensciencegrid/osg-gfactory.git'
  }
}
