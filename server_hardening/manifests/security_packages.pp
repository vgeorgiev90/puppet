class server_hardening::security_packages {
  package { 'epel-release':
    ensure  => present,
  }
  notify { 'Epel-release repository installed': }
  
  package { 'lynis':
    ensure  => present,
  }
  notify { 'Lynis auditing system installed': }
  exec { 'lynis-audit':
    command => '/usr/bin/lynis audit system > /root/lynis-audit.log'
  }
  
  package { 'psacct':
    ensure  => present,
  }
  notify { 'PSact package installed.': }
  
}
