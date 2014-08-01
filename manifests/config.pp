# == Class: shinken::config
#
# Full description of class shinken is in the README.
#
class shinken::config (
  $ensure               = $shinken::config_ensure,
  $options              = $shinken::config_options,
  $config_path          = $shinken::config_path,
  $config_file          = $shinken::config_file,
  $arbiter_options      = $shinken::arbiter_options,
  $broker_options       = $shinken::broker_options,
  $poller_options       = $shinken::poller_options,
  $reactionner_options  = $shinken::reactionner_options,
  $receiver_options     = $shinken::receiver_options,
  $scheduler_options    = $shinken::scheduler_options,
) {
  $merged_options = merge($shinken::defaults::config_options, $options)

  validate_hash($arbiter_options)
  validate_hash($broker_options)
  validate_hash($poller_options)
  validate_hash($reactionner_options)
  validate_hash($receiver_options)
  validate_hash($scheduler_options)

  file { "${config_path}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    owner   => 'shinken',
    content => template('shinken/shinken.cfg.erb')
  }

  shinken::config::arbiter      { 'arbiter':      options => $arbiter_options }
  shinken::config::broker       { 'broker':       options => $broker_options }
  shinken::config::poller       { 'poller':       options => $poller_options }
  shinken::config::reactionner  { 'reactionner':  options => $reactionner_options }
  shinken::config::receiver     { 'receiver':     options => $receiver_options }
  shinken::config::scheduler    { 'scheduler':    options => $scheduler_options }

}

