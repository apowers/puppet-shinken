# == Class: shinken::server::service
#
# Full description of class shinken is in the README.
#
class shinken::server::service (
  $ensure       = $shinken::server::service_ensure,
  $enable       = $shinken::server::service_enable,
  $service_name = $shinken::server::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
