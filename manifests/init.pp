class make_noop (
  Boolean $include_app   = false,
  Boolean $include_agent = true,
) {

  $mco_svc = 'mcollective'
  if $include_agent {
    $ensure_agent = 'file'
  } else {
    $ensure_agent = 'absent'
  }
  if $include_app {
    $ensure_app = 'file'
  } else {
    $ensure_app = 'absent'
  }
  if $include_app or $include_agent {
    $ensure_ddl = 'file'
  } else {
    $ensure_ddl = 'absent'
  }


  # Root user by OS
  case $::kernel {
    'Windows': {
      $mco_dir = 'C:/ProgramData/puppetlabs/mcollective/plugins/mcollective'
      File {
        owner  => 'S-1-5-32-544', # Adminstrator
        group  => 'S-1-5-32-544', # Adminstrators
        mode   => '0664',         # Both user and group need write permission
      }
    }
    'Linux': {
      $mco_dir = '/opt/puppetlabs/mcollective/plugins/mcollective'
      File {
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
      }
    }
    default: {
      fail("Incorrect OS")
    }
  }

  file { "${mco_dir}/application/enable_noop.rb":
    ensure => $ensure_app,
    source => 'puppet:///modules/make_noop/enable_noop.rb',
  }
  file { "${mco_dir}/application/disable_noop.rb":
    ensure => $ensure_app,
    source => 'puppet:///modules/make_noop/disable_noop.rb',
  }
  file { "${mco_dir}/agent/make_noop.rb":
    ensure => $ensure_agent,
    source => 'puppet:///modules/make_noop/make_noop.rb',
    notify => Service[$mco_svc],
  }
  file { "${mco_dir}/agent/make_noop.ddl":
    ensure => $ensure_ddl,
    source => 'puppet:///modules/make_noop/make_noop.ddl',
    notify => Service[$mco_svc],
  }
}
