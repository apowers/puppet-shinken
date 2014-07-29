# == Class: shinken::server::config
#
# Full description of class shinken is in the README.
#
class shinken::server::config (
  $ensure      = $shinken::server::config_ensure,
  $options     = $shinken::server::config_options,
  $config_path  = $shinken::server::config_path,
  $config_file = $shinken::server::config_file,
) {
  $merged_options = merge($shinken::defaults::default_server_options, $options)
  $assignment_character = ' = '

  file { "${config_path}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('shinken/config.erb')
  }
}

