# WebUI Module
class shinken::modules::webui (
  $ensure       = 'present',
  $options      = {},
  $auth_secret  = undef,
) {
  validate_string($auth_secret)
  validate_hash($options)

  $merged_default_options = merge($shinken::defaults::webui_options,$options)
  $merged_options = merge($merged_default_options,{'auth_secret' => $auth_secret})

  shinken::module { 'webui':
    type    => 'webui',
    options => $merged_options,
  }

}
