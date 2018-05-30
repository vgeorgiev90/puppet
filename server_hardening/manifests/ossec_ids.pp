class server_hardening::ossec_ids(
) {
  package { 'gcc':
    ensure => present,
  }
  
  package { 'bind-utils':
    ensure => present,
  }

  exec { 'download-ossec':
    command => '/usr/bin/wget https://github.com/ossec/ossec-hids/archive/2.9.3.tar.gz',
    cwd     => '/root/',
  }

  exec { 'untar-archive':
    command => '/usr/bin/tar -xzf /root/2.9.3.tar.gz && /usr/bin/mv /root/ossec-*/ /root/ossec',
    cwd     => '/root/',
  }

  exec { 'prepare-auto-install':
    command => '/usr/bin/cp /root/ossec/etc/preloaded-vars.conf.example /root/ossec/etc/preloaded-vars.conf',
    cwd     => '/root/',
  }

  file { '/root/prepare-ossec.sh':
    ensure  => file,
    mode    => '0700',
    owner   => 'root',
    source  => 'puppet:///modules/server_hardening/prepare-ossec.sh'
  } 
 
  exec { 'prepare-ossec':
    command => '/root/prepare-ossec.sh',
    cwd     => '/root/',
  }

  exec { 'install-ossec':
    command  =>  '/root/ossec/install.sh',
    cwd      => '/root/ossec/',
  }

  exec { 'start-the-service':
    command  => '/var/ossec/bin/ossec-control start',
  }

  exec { 'remove the source':
    command  => '/usr/bin/rm /root/ossec -rf && /usr/bin/rm /root/2.9.3.tar.gz -rf && /usr/bin/rm /root/prepare-ossec.sh -rf',
    cwd      => '/root/',
  }
}


