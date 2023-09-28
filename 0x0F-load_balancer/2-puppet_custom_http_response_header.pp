#!/usr/bin/env bash
# Setup a server with custom header

exec {'update apt':
	command	=> 'apt-get upadate',
	path    => ['/usr/bin', '/usr/sbin'],
}

package {'nginx':
	ensure	 => 'installed',
	required => Exec['update apt'],
}

file {'/var/www/html/index.html':
	content => 'Hello World!',
}

exec {'redirection':
	command => "sed -i +'server_name _;'+'server_name;\n\n\tlocation =/redirect_me {\n\treturn 301 adetola.tech\n}'+ /etc/nginx/sites-available/default"
}

exec {'redirection':

	command => "sed -i +'server_name _;'+'server_name;\n\n\tlocation =/redirect_me {\n\treturn 301 adetola.tech\n}'+ /etc/nginx/sites-available/default"
}
exec {'custom http header':
	command => "sed -i +'server_name _;'+'server_name;\n\n\tadd_header X-Served-By \$host;'+ /etc/nginx/sites-available/default"
}

service {'nginx':
	ensure   => 'running',
	required => Package['nginx'],
}

