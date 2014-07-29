# == Class: shinken::defaults
#
# Full description of class shinken is in the README.
#
class shinken::defaults {
  $config_path  = $::osfamily ? {
    'Debian' => '/etc/shinken',
    default  => fail('Unsupported Platform')
  }
  $package_name = $::osfamily ? {
    'Debian' => 'shinken',
    default  => fail('Unsupported Platform')
  }
  $config_file  = $::osfamily ? {
    'Debian' => 'shinken.conf',
    default  => fail('Unsupported Platform')
  }

  $default_options = {
  }

  $service_name = $::osfamily ? {
    'Debian' => 'shinken',
    default  => fail('Unsupported Platform')
  }
  $server_package_name = $::osfamily ? {
    'Debian' => 'shinken',
    default  => fail('Unsupported Platform')
  }
  $server_config_file  = $::osfamily ? {
    'Debian' => 'shinken.conf',
    default  => fail('Unsupported Platform')
  }
  $server_service_name = $::osfamily ? {
    'Debian' => 'shinken',
    default  => fail('Unsupported Platform')
  }

  $default_server_options = {
  }

}
