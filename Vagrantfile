# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  
  config.vm.define :management do |management|
    management.vm.box = "lucid32"
	management.vm.box_url = "http://files.vagrantup.com/lucid32.box"
	management.vm.host_name = "management"
	management.vm.network :hostonly, "44.44.44.4"
  end
  
  config.vm.define :mysqldatanode1 do |mysqldatanode1|
    mysqldatanode1.vm.box = "lucid32"
	mysqldatanode1.vm.box_url = "http://files.vagrantup.com/lucid32.box"
	mysqldatanode1.vm.host_name = "data"
	mysqldatanode1.vm.network :hostonly, "44.44.44.2"
  end

  config.vm.define :mysqldatanode2 do |mysqldatanode2|
    mysqldatanode2.vm.box = "lucid32"
	mysqldatanode2.vm.box_url = "http://files.vagrantup.com/lucid32.box"
	mysqldatanode2.vm.host_name = "data"
	mysqldatanode2.vm.network :hostonly, "44.44.44.3"
  end
  
  config.vm.define :mysqlapinode1 do |mysqlapinode1|
    mysqlapinode1.vm.box = "lucid32"
	mysqlapinode1.vm.box_url = "http://files.vagrantup.com/lucid32.box"
	mysqlapinode1.vm.host_name = "api"
	mysqlapinode1.vm.network :hostonly, "44.44.44.5"
  end
  
  config.vm.define :mysqlapinode2 do |mysqlapinode2|
    mysqlapinode2.vm.box = "lucid32"
	mysqlapinode2.vm.box_url = "http://files.vagrantup.com/lucid32.box"
	mysqlapinode2.vm.host_name = "api"
	mysqlapinode2.vm.network :hostonly, "44.44.44.6"
  end

	config.vm.provision :puppet, :module_path => "modules" do |puppet|
		puppet.manifest_file = "site.pp"
	end
  
end
