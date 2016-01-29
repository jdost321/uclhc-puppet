class osg_repos (
    $release = '3.2'
  ) {
  package { 'epel-release':
    ensure => 'latest',
    provider => 'rpm',
    source => "https://dl.fedoraproject.org/pub/epel/epel-release-latest-$operatingsystemmajrelease.noarch.rpm"
  } ->
  package { 'yum-plugin-priorities':
    ensure => 'latest',
    provider => 'yum',
  }

  package { 'osg-release':
    ensure => 'latest',
    provider => 'rpm',
    source => "http://repo.grid.iu.edu/osg/$release/osg-$release-el$operatingsystemmajrelease-release-latest.rpm"
  }
}
