class xrootd (
    $xrootd_version = 'latest',
    $vo = 'atlas',
    $xrd_port = '1094',
    $meta_cmsd_port = '3121',
    $xrd_dir = $fqdn,
    $update_proxy = true,
    $enable_atlas_proxy = false,
    $enable_cms_proxy = false,
    $repo = 'production',

## SITE IN A BOX PARAMETERS
    $xrootd_siab = 'FALSE'
  ) 

{
  require osg_repos
  require ucsd_repo
  require client_tools

  $repo_args = $repo ? {
    'production' => [],
    'testing' => [ '--enablerepo=osg-testing' ],
    'development' => [ '--enablerepo=osg-development' ]
  }

  package { 'xrootd':
    ensure => $xrootd_version,
    provider => 'yum',
    install_options => $repo_args
  }
  package { 'xrootd-voms-plugin':
    ensure => 'latest',
    provider => 'yum',
    install_options => $repo_args
  }
  package { 'xrootd-client':
    ensure => $xrootd_version,
    provider => 'yum',
    install_options => $repo_args
  }

  include xrootd::grid_proxy
  include xrootd::service_cert
  include xrootd::user_enviroment
  if ($xrootd_siab) == 'TRUE' {
	include xrootd::siab_server
	include xrootd::siab_config
  }
  else {
        include xrootd::base_config
	include xrootd::basic_server
        include xrootd::cluster_config
        include xrootd::proxy_config
  }


}
