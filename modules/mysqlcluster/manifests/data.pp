class mysqlcluster::data {

	exec { "install_db" :
		path => ["/bin", "/usr/bin"],
		command => "/usr/local/mysql-cluster/scripts/mysql_install_db --user=mysql --datadir=/var/lib/mysql-ndb-data --basedir=/usr/local/mysql-cluster",
		require => Class["mysqlcluster"],
	}
	
	exec { "connect_node" :
		path => ["/bin", "/usr/bin"],
		command => "sudo /usr/local/mysql-cluster/bin/ndbd --ndb-connectstring=44.44.44.4:2205",
		require => Exec["install_db"],
	}
}