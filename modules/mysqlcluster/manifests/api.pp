class mysqlcluster::api {
	
	file { "/etc/mysqld-cluster.cf":
		source => "puppet:///modules/mysqlcluster/mysqld-cluster.cf",
		require => Class["mysqlcluster"],
		owner  => "mysql",
		group  => "mysql",
		mode   => 700,
	}
	
	exec { "install_db" :
		path => ["/bin", "/usr/bin"],
		command => "/usr/local/mysql-cluster/scripts/mysql_install_db --user=mysql --datadir=/var/lib/mysql-node-data --basedir=/usr/local/mysql-cluster",
		require => File["/etc/mysqld-cluster.cf"],
	}
	
	file { '/usr/local/mysql':
		ensure => 'link',
		target => '/usr/local/mysql-cluster',
		require => Exec["install_db"],
	}
	
	exec { "connect_api_node" :
		path => ["/bin", "/usr/bin"],
		command => "/usr/local/mysql-cluster/bin/mysqld_safe --defaults-extra-file=/etc/mysqld-cluster.cf --user=mysql --datadir=/var/lib/mysql-node-data --basedir=/usr/local/mysql-cluster &",
		require => File["/usr/local/mysql"],
	}

	mysqldbremote { "aurora-remote":
		user => "root",
		require => Exec["install_db"],
	}
}

define mysqldbremote( $user ) {
	exec { "grant-access-${name}-db":
		command => "/usr/local/mysql-cluster/bin/mysql -uroot -e \"update mysql.user set host='%' where user='${user}' and host='localhost';flush privileges;\"",
	}
}