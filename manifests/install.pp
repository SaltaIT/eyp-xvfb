class xvfb::install inherits xvfb {

  if($xvfb::manage_package)
  {
    package { $xvfb::params::package_name:
      ensure => $xvfb::package_ensure,
    }
  }

  if($xvfb::listen_tcp)
  {
    $exec_start_cmd='/usr/bin/Xvfb %i'
  }
  else
  {
    $exec_start_cmd='/usr/bin/Xvfb %i -nolisten tcp'
  }

  if($xvfb::params::systemd)
  {
    include ::systemd

    systemd::service { 'xvfb@':
      execstart   => $exec_start_cmd,
      description => 'Xvfb (%i)',
    }
  }
}
