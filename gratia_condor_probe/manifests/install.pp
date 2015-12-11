# gratia_condor_probe/manifests/install.pp
# == Class: gratia_condor_probe::install ===========================
#
# This module manages gratia_condor_probe installation and auxilary software
# ===========================================
# Developed by Edgar Fajardo
# on behalf of OSG Software
# == Architecture ======================
#
# === Parameters =========================
#
#
# [*package_ensure*]
# Specifies if a package is wanted installed or latest. Only this two vaules are allowed.
#
#
class gratia_condor_probe::install (
    $package_ensure = "installed",
    )
{
    include osg_repos
    package{ 'gratia-probe-condor':
           ensure   => $package_ensure,
           provider => 'yum',
           name     => "gratia-probe-condor",
           install_options => [{'--enablerepo' => 'epel'},
                               {'--enablerepo' => 'osg'}
                               ]
         }

}
