class my_apache::params {
  $package_name = 'httpd'
  $service_name = 'httpd'
  $vhostdir     = '/etc/httpd/conf.d/vhosts'
  $port         = 80
  $docroot      = '/var/www/html/'
  $servername   = $facts['hostname']
  $phpversion   = 'php56'
  $confdir      = '/etc/httpd/conf.d'
}
