class xvfb::install inherits xvfb {

  if($xvfb::manage_package)
  {
    package { $xvfb::params::package_name:
      ensure => $xvfb::package_ensure,
    }
  }

  if($xvfb::params::systemd)
  {
    include ::systemd

    systemd::service { 'xvfb@':
      execstart   => '/usr/bin/Xvfb %i',
      description => 'Xvfb (%i)',
    }
  }
}
