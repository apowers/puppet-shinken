# Create a Shinken Module
define shinken::config::arbiter (
  $ensure   = 'present',
  $options  = {},
) {
  validate_hash($options)
  $merged_options = merge($shinken::defaults::arbiter_options,$options)

  file { "${::shinken::config_path}/arbiters/${name}.cfg":
    ensure  => $ensure,
    mode    => '0444',
    owner   => 'shinken',
    content => template('shinken/config.cfg.erb'),
    notify  => Class['::shinken::service'],
  }

}
