class server_hardening::kernel_secure(
) {

  exec { 'protect-from-bad-icmp': 
    command => '/usr/bin/echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /etc/sysctl.conf'
  }

  exec { 'turn-on-exec-shield':
    command => '/usr/bin/echo "kernel.exec-shield = 1" >> /etc/sysctl.conf' 
  }

  exec { 'syncookies-on-for-SYN-flood':
    command => '/usr/bin/echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf'
  }

  exec { 'avoid-smurf-attacks':
    command => '/usr/bin/echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.conf'
  }

  exec { 'fork-prevention':
    command => '/usr/bin/echo "kernel.pid_max = 65536" >> /etc/sysctl.conf'
  }

  file { '/root/kernel-options-enabled':
    ensure => file,
    owner  => 'root',
    source => 'puppet:///modules/server_hardening/kernel',
  }
 }


