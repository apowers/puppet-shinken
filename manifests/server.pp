# == Class: shinken::server
#
# This class installs and configures the shinken server.
# Full description of class shinken is in the README.
#
class shinken::server (
  $config_ensure  = 'present',
  $config_options = {},
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $shinken::defaults::server_service_name,
  $package_name   = $shinken::defaults::server_package_name,
  $config_file    = $shinken::defaults::server_config_file,
) inherits shinken::defaults {
  anchor { 'shinken::server::begin':   } ->
  class  { 'shinken::server::package': } ->
  class  { 'shinken::server::config':  } ~>
  class  { 'shinken::server::service': } ->
  anchor { 'shinken::server::end': }
}
