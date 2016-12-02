class xvfb::service inherits xvfb {

  #
  validate_bool($xvfb::manage_docker_service)
  validate_bool($xvfb::manage_service)
  validate_bool($xvfb::service_enable)

  validate_re($xvfb::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${xvfb::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $xvfb::manage_docker_service)
  {
    if($xvfb::manage_service)
    {
      service { $xvfb::params::service_name:
        ensure => $xvfb::service_ensure,
        enable => $xvfb::service_enable,
      }
    }
  }
}
