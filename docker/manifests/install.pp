class docker::install {

  exec { 'get-repo-key':
     command => '/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add -',
  } ->

  exec { 'add-docker-repo': 
     command => '/usr/bin/add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"',
  } ->

  exec { 'update':
     command => '/usr/bin/apt-get update',
  }

  package { 'docker-ce':
     ensure => latest,
  } ->

  service { 'docker': 
     ensure  => running,
     enable => true
  }

}
