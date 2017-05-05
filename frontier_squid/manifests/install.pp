# frontier_squid/manifests/install.pp
# == Class: frontier_squid::install ===========================
#
# This module manages frontier-squid installation and auxilary software
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
class frontier_squid::install (
    $package_ensure = "installed",
    )
{
    include osg_repos
    package{ 'frontier-squid':
           ensure   => $package_ensure,
           provider => 'yum',
           name     => "frontier-squid"
         }
    


}
