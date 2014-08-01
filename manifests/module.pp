# Create a Shinken Module
define shinken::module (
  $ensure   = 'present',
  $type     = undef,
  $options  = {},
) {
  $module_path  = "${::shinken::config_path}/modules"

  validate_absolute_path($module_path)
  validate_hash($options)

  exec { "shinken_install_${type}" :
    command => "/usr/bin/shinken install ${type}",
    unless  => "/usr/bin/shinken inventory|/bin/grep -q ${type}",
  } ->
  file { "${module_path}/${type}.cfg":
    ensure  => $ensure,
    mode    => '0440',
    owner   => 'shinken',
    content => template('shinken/module.cfg.erb'),
    notify  => Class['::shinken::service'],
  }

}
