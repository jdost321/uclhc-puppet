class kerberos ()
{
  require osg_repos
  package { 'krb5-workstation':
    ensure => 'latest',
    provider => 'yum',
    install_options => [{'--enablerepo' => 'epel'}, {'--enablerepo' => 'osg'}]
  }

  file { '/etc/krb5.conf':
    ensure  => 'present',
    source => 'puppet:///modules/kerberos/krb5.conf',
    require => Package['krb5-workstation'],
  }
  

}
