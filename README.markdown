# shinken

This is the shinken module.

# Requirements

* Puppetlabs/stdlib

# Installation

  puppet module install seattle-biomed/shinken

# Synopsis

  Install and manage shinken service.

# Parameters

- *config_ensure* (Default: 'present')
- *config_options* (Default: Empty)
- *package_ensure* (Default: 'true')
- *service_ensure* (Default: 'running')
- *service_enable* (Default: 'true')

# Examples

Basic Installation

  include '::shinken'

Parameterized Installation

  $config_options = {
    option => value
  }

  class { '::shinken':
    config_ensure  => 'present',
    config_options => $config_options,
    package_ensure => 'true',
    service_ensure => 'running',
    service_enable => 'true',
  }

Installation with Hiera

  ---
  class:  - shinken
  shinken::config::ensure:  'present'
  shinken::config::options:
    option: value
  shinken::package::ensure:  'true'
  shinken::service::ensure:  'running'
  shinken::service::enable:  'true'

# License

  See LICENSE

# Contact


# Support

Please log tickets and issues at our [Projects site](https://github.com/seattle-biomed/shinken)
