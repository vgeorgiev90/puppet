class docker_swarm::swarm_init(
  $swarm_ip  =  hiera('swarm_ip')

) {

  exec { 'init-swarm':
    command => "docker swarm init --advertise-addr ${swarm_ip}",
    path    => '/usr/bin:/bin',
  }

  exec { 'get-token':
    command => 'docker swarm join-token worker > /root/swarm-join-token',
    path    => '/usr/bin:/bin',
  }

}
