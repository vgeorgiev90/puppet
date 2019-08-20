define docker::container(
	String $cont_name,
	Hash $ports,
	Hash $volumes,
	Hash $env,
	String $image

) {

	exec { "${cont_name}":
		command => "docker rm ${cont_name} || true && docker run -d --rm --name $cont_name -p ${ports['host']}:${ports['container']} -v ${volumes['host']}:${volumes['container']} -e ${env['name']}=${env['value']} $image",
		path => '/usr/bin:/bin',
		unless => "docker ps -a | grep ${cont_name} 2>/dev/null 1>&2",
	}



}
