class server_hardening::firewall(
  Array[String] $whitelist = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
) {  
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
 
  package { 'perl-libwww-perl':
    ensure => present,
  }  

  package { 'perl-Time-HiRes':
    ensure => present,
  }

  exec { 'csf-download':
   command => "/usr/bin/wget https://download.configserver.com/csf.tgz && /usr/bin/tar -xzf /usr/src/csf.tgz",
   cwd     => "/usr/src",
  }

  exec { 'csf-install':
   command => "/usr/src/csf/install.sh",
   cwd     => "/usr/src/csf/",
  }

  exec { 'change-config':
   command => "/usr/bin/sed -i 's/TESTING = \"1\"/TESTING = \"0\"/' /etc/csf/csf.conf"
  }
  
  file { '/etc/csf/csf.allow':
   ensure => file,
   content => template('server_hardening/csf.allow.erb')
  }

  service { 'csf':
   ensure => running,
   enable => true,
  }

  service { 'lfd':
   ensure => running,
   enable => true,
  }

}
