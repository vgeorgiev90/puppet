class mysql::install(
  $package = hiera('mysql::package')
) {

  package { 'mysql-install':
    ensure => present,
    name   => $package,
  }

}
