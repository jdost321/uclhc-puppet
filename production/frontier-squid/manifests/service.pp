# == Class: frontier-squid::service
#
# This module manages the basic frontier-squid services
#
# === Parameters
#
class frontier-squid::service {
    service { 'frontier-squid':
          ensure     => running,
          name       => "frontier-squid",
          enable     => true,
          hasrestart => true
        }
}

              
