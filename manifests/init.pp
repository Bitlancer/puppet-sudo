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
  $sources        = ["files", "sss"],
  $package_name   = 'sudo',
  $package_ensure = 'latest'
) {

  if is_array($sources) {
    $_sources = join($sources, ' ')
  }
  else {
    $_sources = $sources
  }

  package { $package_name:
    ensure => $package_ensure
  }

  file_line { 'nsswitch sudo entries':
    path  => '/etc/nsswitch.conf',
    line  => "sudoers: ${_sources}",
    match => "^sudoers.*"
  }
}
