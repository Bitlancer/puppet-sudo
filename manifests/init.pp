# == Class: sudo
#
# This class installs sudo with an SSSD backend
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# Bitlancer LLC (contact@bitlancer.com)
#
class sudo (
) {
  package { sudo:
    ensure => latest,
  }
  augeas { 'nsswitch enable sudo':
    context => "/files/etc/nsswitch.conf",
    changes => [
      "set database[. = 'sudoers'] sudoers",
      "set database[. = 'sudoers']/service[1] sss",
    ],
  }
}
