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
    'Debian' => 'shinken.cfg',
    default  => fail('Unsupported Platform')
  }
  $service_name = $::osfamily ? {
    'Debian' => 'shinken',
    default  => fail('Unsupported Platform')
  }

  $webui_options = {
    'host'              => '0.0.0.0',
    'port'              => '7767',
    'allow_html_output' => '0',
    'modules'           => 'Cfg_password',
    'max_output_length' => '1024',
    'manage_acl'        => '1',
    'play_sound'        => '0',
    'login_text'        => 'Welcome on Shinken WebUI',
  }

  $config_options = {
    'cfg_dir' => [
      'commands',
      'timeperiods',
      'escalations',
      'dependencies',
      'templates',
      'notificationways',
      'servicegroups',
      'hostgroups',
      'contactgroups',
      'hosts',
      'services',
      'contacts',
      'packs',
      'modules',
      'arbiters',
      'schedulers',
      'pollers',
      'reactionners',
      'brokers',
      'receivers',
      'realms',
      'resource.d',
    ],
    'ca_cert' => '/etc/shinken/certs/ca.pem',
    'daemon_enabled' => '1',
    'disable_old_nagios_parameters_whining' => '0',
    'enable_environment_macros' => '0',
    'enable_problem_impacts_states_change' => '1',
    'flap_history' => '20',
    'hard_ssl_name_check' => '0',
    'http_backend' => 'auto',
    'local_log' => '/var/log/shinken/arbiterd.log',
    'lock_file' => '/var/run/shinken/arbiterd.pid',
    'log_initial_states' => '0',
    'max_host_check_spread' => '1',
    'max_plugins_output_length' => '65536',
    'max_service_check_spread' => '1',
    'modules_dir' => '/var/lib/shinken/modules',
    'no_event_handlers_during_downtimes' => '1',
    'pack_distribution_file' => '/var/lib/shinken/pack_distribution.dat',
    'retention_update_interval' => '60',
    'server_cert' => '/etc/shinken/certs/server.cert',
    'server_key' => '/etc/shinken/certs/server.key',
    'service_check_timeout' => '60',
    'shinken_group' => 'shinken',
    'shinken_user' => 'shinken',
    'timeout_exit_status' => '2',
    'use_ssl' => '0',
    'workdir' => '/var/lib/shinken/',
  }

  $arbiter_options = {
    'arbiter_name'        => 'arbiter-master',
    'address'             => 'localhost',
    'port'                => '7770',
    'spare'               => '0',
    'modules'             => 'named-pipe',
    'use_ssl'             => '0',
    'hard_ssl_name_check' => '0',
  }

  $broker_options = {
    'broker_name'         => 'broker-master',
    'address'             => 'localhost',
    'port'                => '7772',
    'spare'               => '0',
    'manage_arbiters'     => '1',
    'manage_sub_realms'   => '1',
    'timeout'             => '3',
    'data_timeout'        => '120',
    'max_check_attempts'  => '3',
    'check_interval'      => '60',
    'modules'             => '',
    'use_ssl'             => '0',
    'hard_ssl_name_check' => '0',
    'realm'               => 'All',
  }

  $poller_options = {
    'poller_name'         => 'poller-master',
    'address'             => 'localhost',
    'port'                => '7771',
    'spare'               => '0',
    'manage_sub_realms'   => '0',
    'min_workers'         => '0',
    'max_workers'         => '0',
    'processes_by_worker' => '256',
    'polling_interval'    => '1',
    'timeout'             => '3',
    'data_timeout'        => '120',
    'max_check_attempts'  => '3',
    'check_interval'      => '60',
    'modules'             => '',
    'use_ssl'             => '0',
    'hard_ssl_name_check' => '0',
    'realm'               => 'All',
  }

  $reactionner_options = {
    'reactionner_name'    => 'reactionner-master',
    'port'                => '7769',
    'address'             => 'localhost',
    'spare'               => '0',
    'manage_sub_realms'   => '0',
    'min_workers'         => '1',
    'max_workers'         => '15',
    'polling_interval'    => '1',
    'timeout'             => '3',
    'data_timeout'        => '120',
    'max_check_attempts'  => '3',
    'check_interval'      => '60',
    'modules'             => '',
    'use_ssl'             => '0',
    'hard_ssl_name_check' => '0',
    'realm'               => 'All',
  }

  $receiver_options = {
    'receiver_name'       => 'receiver-master',
    'address'             => 'localhost',
    'port'                => '7773',
    'spare'               => '0',
    'timeout'             => '3',
    'data_timeout'        => '120',
    'max_check_attempts'  => '3',
    'check_interval'      => '60',
    'modules'             => '',
    'use_ssl'             => '0',
    'hard_ssl_name_check' => '0',
    'direct_routing'      => '0',
    'realm'               => 'All',
  }

  $scheduler_options = {
    'scheduler_name'      => 'scheduler-master',
    'address'             => 'localhost',
    'port'                => '7768',
    'spare'               => '0',
    'timeout'             => '3',
    'data_timeout'        => '120',
    'max_check_attempts'  => '3',
    'check_interval'      => '60',
    'weight'              => '1',
    'modules'             => '',
    'use_ssl'             => '0',
    'hard_ssl_name_check' => '0',
    'skip_initial_broks'  => '0',
    'realm'               => 'All',
  }

}
