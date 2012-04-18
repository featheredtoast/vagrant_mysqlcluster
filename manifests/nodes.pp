node management {
	include apt
    include baseclass
	include vim
	include mysqlcluster
	include "mysqlcluster::management"
}

node data{
	include apt
    include baseclass
	include vim
	include mysqlcluster
	include "mysqlcluster::data"
}
node api{
	include apt
    include baseclass
	include vim
	include mysqlcluster
	include "mysqlcluster::api"
}