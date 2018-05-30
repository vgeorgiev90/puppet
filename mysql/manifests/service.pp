class mysql::service(
  $service  = hiera('mysql::service'),
  $password = hiera('mysql::password')
) {
  
  service { 'mysql-server':
    ensure => running,
    enable => true,
    name   => $service,
  } ->
  
  exec { 'change-root-pass':
    command => "mysqladmin -u root password ${password}",
    path    => '/usr/bin:/bin:/usr/local/bin',
  }


}
