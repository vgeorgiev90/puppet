class my_apache::install(
) inherits my_apache::params {
  package { 'apache-install':
    ensure => present,
    name   => $my_apache::params::package_name,
  }

  exec { 'include-optional-conf':
    command => 'echo "IncludeOptional conf.d/vhosts/*.conf" >> /etc/httpd/conf/httpd.conf'
    path    => '/usr/bin:/bin'
  }

}
