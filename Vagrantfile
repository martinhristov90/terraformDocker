Vagrant.configure(2) do |config|
    config.vm.box = "xenial"
    config.vm.box_url = "martinhristov90/ubuntu1604"
    config.vm.provision "shell", path: "scripts/provision.sh" , privileged: false
    config.vm.provision "shell", path: "scripts/installTerraform.sh" , privileged: true
    config.vm.synced_folder ".", "/home/vagrant/outerDir", disabled: false
end