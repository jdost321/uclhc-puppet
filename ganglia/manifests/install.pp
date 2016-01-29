# ganglia/manifests/install.pp
# == Class: cvmfs::ganglia ===========================
#
# This module manages cvmfs installation and auxilary software
# ===========================================
# Developed by Edgar Fajardo
# on behalf of UCLHC
# == Architecture ======================
#
# === Parameters =========================
#
#
# [*package_ensure*]
# Specifies if a package is wanted installed or latest. Only this two vaules are allowed.
#
#
class ganglia::install (
    $package_ensure = "installed",
    )
{
    include osg_repos
    package{ 'ganglia-gmond':
           ensure   => $package_ensure,
           provider => 'yum',
           name     => "ganglia-gmond"
         }
    


}
