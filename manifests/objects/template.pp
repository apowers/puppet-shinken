# Create a Shinken Module
define shinken::objects::template (
  $ensure       = 'present',
  $object_type  = undef,
  $options      = {},
) {
  $resource_path  = "${::shinken::config_path}/templates"

  validate_string($object_type)
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
