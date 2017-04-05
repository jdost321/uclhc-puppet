class gwms_factory::factory (
    $osg_release = '3.3'
  ) {
  include gwms_factory::factory::osg_repos
  include gwms_factory::factory::grid_certs
}
