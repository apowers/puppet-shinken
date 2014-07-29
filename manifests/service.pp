# == Class: shinken::service
#
# Full description of class shinken is in the README.
#
class shinken::service (
  $ensure       = $shinken::service_ensure,
  $enable       = $shinken::service_enable,
  $service_name = $shinken::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
