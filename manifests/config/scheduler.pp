# Create a Shinken Module
define shinken::config::scheduler (
  $ensure   = 'present',
  $options  = {},
) {
  validate_hash($options)
  $merged_options = merge($shinken::defaults::scheduler_options,$options)

  file { "${::shinken::config_path}/schedulers/${name}.cfg":
    ensure  => $ensure,
    mode    => '0444',
    owner   => 'shinken',
    content => template('shinken/config.cfg.erb'),
    notify  => Class['::shinken::service'],
  }

}
