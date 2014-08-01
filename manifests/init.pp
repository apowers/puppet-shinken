# == Class: shinken
#
# This class installs and configures the shinken client.
# Full description of class shinken is in the README.
#
class shinken (
  $config_ensure        = 'present',
  $package_ensure       = 'installed',
  $service_ensure       = 'running',
  $service_enable       = true,
  $service_name         = $shinken::defaults::service_name,
  $package_name         = $shinken::defaults::package_name,
  $config_path          = $shinken::defaults::config_path,
  $config_file          = $shinken::defaults::config_file,
  $config_options       = {},
  $arbiter_options      = {},
  $broker_options       = {},
  $poller_options       = {},
  $reactionner_options  = {},
  $reciever_options     = {},
  $scheduler_options    = {},
) inherits shinken::defaults {
  anchor { 'shinken::begin':   } ->
  class  { 'shinken::package': } ->
  class  { 'shinken::config':  } ~>
  class  { 'shinken::service': } ->
  anchor { 'shinken::end': }
}
