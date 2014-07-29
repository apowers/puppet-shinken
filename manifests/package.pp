# == Class: shinken::package
#
# Full description of class shinken is in the README.
#
class shinken::package (
  $ensure       = $shinken::package_ensure,
  $package_name = $shinken::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
