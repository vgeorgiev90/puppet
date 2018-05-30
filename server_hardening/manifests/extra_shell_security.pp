class server_hardening::extra_shell_security(
  $shell_sec_user,
  $shell_sec_pass,
) {
  
    file { '/bin/secure_shell':
      ensure => file,
      owner  => 'root',
      mode   => '0755',
      content => template('server_hardening/secure_shell.erb'),
    }

    exec { 'modify-/etc/shells':
      command  => '/usr/bin/echo "/bin/secure_shell" >> /etc/shells',
    }

    exec { 'change-user-shell':
      command  => "/usr/bin/chsh $shell_sec_user -s /bin/secure_shell",
    }

  }


