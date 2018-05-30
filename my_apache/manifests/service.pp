class my_apache::service(
  $service_name = $my_apache::service_name
) inherits my_apache::params {
  
  service { 'apache-service':
    ensure     => running,
    enable     => true,
    name       => $my_apache::params::service_name,
    hasrestart => true,
  }

}
