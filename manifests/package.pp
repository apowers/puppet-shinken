# == Class: shinken::package
#
# Full description of class shinken is in the README.
#
class shinken::package (
  $ensure       = $shinken::package_ensure,
  $package_name = $shinken::package_name,
) {
  Package['python-pip'] -> Package <| provider == 'pip' and ensure != absent and ensure != purged |>

  user { 'shinken':
    ensure => 'present',
  } ->
  package { $package_name:
    ensure   => $ensure,
    provider => 'pip',
  } ~>
  exec { 'shinken-init': command => '/usr/bin/shinken --init' }
}
