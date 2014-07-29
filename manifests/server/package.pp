# == Class: shinken::server::package
#
# Full description of class shinken is in the README.
#
class shinken::server::package (
  $ensure       = $shinken::server::package_ensure,
  $package_name = $shinken::server::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
