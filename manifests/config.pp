# == Class: shinken::config
#
# Full description of class shinken is in the README.
#
class shinken::config (
  $ensure      = $shinken::config_ensure,
  $options     = $shinken::config_options,
  $config_path = $shinken::config_path,
  $config_file = $shinken::config_file,
) {
  $merged_options = merge($shinken::defaults::default_options, $options)
  $assignment_character = ' = '

  file { "${config_path}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('shinken/config.erb')
  }
}

