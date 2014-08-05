# Create a Shinken Module
define shinken::objects::host (
  $ensure   = 'present',
  $options  = {},
) {
  $object_type    = 'host'
  $resource_path  = "${::shinken::config_path}/hosts"

  validate_absolute_path($resource_path)
  validate_hash($options)

  file { "${resource_path}/${name}.cfg":
    ensure  => $ensure,
    mode    => '0440',
    owner   => 'shinken',
    content => template('shinken/object.cfg.erb'),
    notify  => Class['::shinken::service'],
  }

}
