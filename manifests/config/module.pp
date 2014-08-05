# Create a Shinken Module
define shinken::config::module (
  $ensure       = 'present',
  $module_type  = undef,
  $options      = {},
) {
  $module_path  = "${::shinken::config_path}/modules"

  validate_absolute_path($module_path)
  validate_hash($options)

  exec { "shinken_install_${name}" :
    command => "/usr/bin/shinken install ${name}",
    unless  => "/usr/bin/shinken inventory|/bin/grep -q ${name}",
  } ->
  file { "${module_path}/${module_type}.cfg":
    ensure  => $ensure,
    mode    => '0440',
    owner   => 'shinken',
    content => template('shinken/module.cfg.erb'),
    notify  => Class['::shinken::service'],
  }

}
