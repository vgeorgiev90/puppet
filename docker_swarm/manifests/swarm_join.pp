class docker_swarm::swarm_join(
  $join_token = hiera('swarm_token'),
  $docker_package = hiera('docker_package')
) {
  require docker_swarm::install
  
  exec { 'join-swarm':
    command  => "${join_token}",
    path     => '/usr/bin:/bin',
  }

}
