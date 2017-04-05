class gwms_factory::factory (
    $osg_release = '3.3',
    $condor_version = 'latest',
    $gwms_version = 'latest'
  ) {
  include gwms_factory::factory::osg_repos
  include gwms_factory::factory::grid_certs
  include gwms_factory::factory::condor
}
