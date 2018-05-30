class docker_swarm::install(
  $docker_package     = hiera('docker_package'),
  $packages           = hiera_array('packages'),
  $docker_service     = hiera('docker_service'),
) {
  
  $packages.each |$pkg| {
     package { "${pkg}":
       ensure => present,
     }
  }

  file { '/etc/yum.repos.d/docker.repo':
    ensure => file,
    source => 'puppet:///modules/docker_swarm/docker.repo',
  } 

  package { "${docker_package}":
    ensure => present,
    notify => Exec['ip-forward'],
  }

  exec { 'ip-forward':
    command => 'echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf',
    path    => '/usr/bin',
  }

  file { '/etc/docker':
    ensure  => directory,
    mode    => '0755'
  }

  file { '/etc/docker/daemon.json':
    ensure  => file,
    source  => 'puppet:///modules/docker_swarm/daemon.json',
    notify  => Service["${docker_service}"],
  }

  file { '/root/firewall.sh':
    ensure => file,
    mode   => '0700',
    owner  => 'root',
  }

  exec { 'firewall':
    command => '/root/firewall.sh && /usr/bin/rm -rf /root/firewall.sh',
    path    => '/root',
  }

  service { "${docker_service}":
    ensure  => running,
    enable  => true,
  }

}
