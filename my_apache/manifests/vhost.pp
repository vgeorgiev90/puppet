define my_apache::vhost(
  Integer $port,
  String  $docroot,
  String  $servername = $title,
  String  $phpversion = $::my_apache::params::phpversion,
  String  $vhostdir   = $::my_apache::params::vhostdir,
) {

  file { "${vhostdir}": 
    ensure => 'directory',
    mode   => '0755',
  }

  file { "${vhostdir}/${servername}.conf":
    ensure  => file,
    mode    => '0644',
    content => template('my_apache/vhost.erb'),
    notify  => Exec['restart-apache'],
  }

  exec { 'restart-apache':
  command => "systemctl reload $my_apache::params::service_name",
  path    => "/usr/bin/",
  }


}

