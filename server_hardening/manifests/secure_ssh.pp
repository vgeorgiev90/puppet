class server_hardening::secure_ssh(
  $ssh_port,
  $ssh_root_login,
  $ssh_pass_auth,
  $ssh_address,
) {
  file { '/etc/ssh/sshd_config':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    content => template('server_hardening/sshd_config.erb')
  }

  exec { 'restart-ssh-service':
    command => 'systemctl restart sshd',
    path    => '/usr/bin',
  }
}

