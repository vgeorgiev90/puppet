class mysql::db_user_add(
  $user      = hiera_hash('mysql::user'),
  $database  = hiera('mysql::database'),
  $root_pass = hiera('mysql::password')
) {
  file { '/root/.my.cnf':
    ensure  => file,
    content => template('mysql/my.cnf.erb'),
    owner   => 'root',
    mode    => '0600',
  } ->

  file { '/root/db_user_add.sh':
    ensure  => file,
    content => template('mysql/db_user_add.sh.erb'),
    owner   => 'root',
    mode    => '0700',
  } ->

  exec { 'add-user':
    command => '/root/db_user_add.sh',
    path    => '/root',
  } ->
  
  exec { 'remove-script':
    command => 'rm -rf /root/db_user_add.sh',
    path    => '/usr/bin:/bin',
  }

}
