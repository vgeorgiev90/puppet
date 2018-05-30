class my_apache::vhost_create(
  $port       =  $my_apache::params::port,
  $docroot    =  $my_apache::params::docroot,
  $servername =  $my_apache::params::servername,
) inherits my_apache::params {


my_apache::vhost { "${servername}":
  port => $port,
  docroot => $docroot,
}


}
