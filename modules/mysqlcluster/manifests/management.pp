class mysqlcluster::management {
	
	file { "/var/lib/mysql-mgmd-config-cache":
		ensure => "directory",
		require => Class["mysqlcluster"],
		owner  => "mysql",
		group  => "mysql",
		mode   => 700,
	}
	
	file { "/var/lib/mysql-mgmd-data":
		ensure => "directory",
		require => Class["mysqlcluster"],
		owner  => "mysql",
		group  => "mysql",
		mode   => 700,
	}
	
	file { "/var/lib/mysql-mgmd-data/config.ini" :
		owner => "root", group => "root",
		source => "puppet:///modules/mysqlcluster/config.ini",
		require => File["/var/lib/mysql-mgmd-config-cache","/var/lib/mysql-mgmd-data"],
	}
	
	exec { "runcluster" :
		path => ["/bin", "/usr/bin"],
		command => "/usr/local/mysql-cluster/bin/ndb_mgmd --initial --configdir=/var/lib/mysql-mgmd-config-cache --config-file=/var/lib/mysql-mgmd-data/config.ini",
		require => File["/var/lib/mysql-mgmd-data/config.ini"],
	}
	
}