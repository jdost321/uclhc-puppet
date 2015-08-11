# ganglia/manifests/service.pp
# == Class: ganglia::install ===========================
#
# This module manages gangliarunningand auxilary software
# ===========================================
# Developed by Edgar Fajardo
# on behalf of OSG Software
# == Architecture ======================
#
# === Parameters =========================
#
class ganglia::service()
{
   service {'gmond':
          ensure    => 'running',
          enable    => true,
        }

}
