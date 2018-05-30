class my_apache::php_fpm(
  $phpversion = $my_apache::params::phpversion,
  $fpmdir     = "/etc/opt/remi/${phpversion}/php-fpm.d"
) inherits my_apache::params {

  exec { 'remi-repo':
    command   => 'yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm || true',
    path      => '/usr/bin:/bin'
  }

  package { "${phpversion}-php-fpm":
    ensure => present,
  }

  file { "${my_apache::params::confdir}/${phpversion}.conf":
    ensure  => file,
    content => template('my_apache/php.conf.erb'),
  }

  file { "${fpmdir}/www.conf":
    ensure  => file,
    content => template('my_apache/www.conf.erb'),
  }

  file { "/var/run/php-fpm/":
    ensure => directory,
  }

  service { "${phpversion}-php-fpm": 
    ensure => running,
    enable => true,
  }

}
