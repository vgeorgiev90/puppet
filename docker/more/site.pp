node 'viktorgeorgiev2c.mylabserver.com' {


class { '::docker': }

-> docker::container { 'nginx':
	cont_name    => lookup("cont_name1"),
	ports        => lookup("ports1"),
	volumes      => lookup("volumes1"),
	image        => lookup("image1"),
	env          => lookup("env1"),
  }

   docker::container { 'mysql':
        cont_name    => lookup("cont_name2"),
        ports        => lookup("ports2"),
        volumes      => lookup("volumes2"),
        image        => lookup("image2"),
        env          => lookup("env2"),
   }

}

