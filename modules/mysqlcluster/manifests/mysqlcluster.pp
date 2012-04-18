class mysqlcluster::mysqlcluster {
	
	$basepackages = [ "libaio1"]
	package { $basepackages: ensure => "latest" }
	
	file { "/mysql-cluster-gpl-7.2.5-linux2.6-i686.tar.gz":
		owner => "root", group => "root",
		source => "puppet:///modules/mysqlcluster/mysql-cluster-gpl-7.2.5-linux2.6-i686.tar.gz",
	}
	
	file { "/mysqlclusterscript.sh":
		owner => "root", group => "root",
		source => "puppet:///modules/mysqlcluster/mysqlclusterscript.sh",
	}
	
	user { "mysql" :
		ensure     => "present",
		require => File["/mysqlclusterscript.sh","/mysql-cluster-gpl-7.2.5-linux2.6-i686.tar.gz"],
	}
	
	exec { "setupcluster" :
		path => ["/bin", "/usr/bin"],
		command => "sudo /mysqlclusterscript.sh",
		require => User["mysql"],
	}
	
}