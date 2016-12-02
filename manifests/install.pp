class xvfb::install inherits xvfb {

  if($xvfb::manage_package)
  {
    package { $xvfb::params::package_name:
      ensure => $xvfb::package_ensure,
    }
  }

}
