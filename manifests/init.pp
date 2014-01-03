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
  package [ 'sudo':
    ensure => latest,
  }
}
