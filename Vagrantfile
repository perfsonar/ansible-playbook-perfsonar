
# perfSONAR dev environment
#


hosts = [
      
      [ "esmond",		"10.0.0.2" ],
      [ "centos7",		"10.0.0.3" ],
      [ "ubuntu18",		"10.0.0.4" ]
]

private_network_name = "perfsonar-"
private_network_name << ENV['USER']

etc_hosts = hosts.map { |host, ip| "#{ip} #{host}" }.join("\n")

Vagrant.configure("2") do |config|

  # The default E1000 has a security vulerability.
  # this suppresses a Vagrant complaint
  config.vm.provider "virtualbox" do |vbox|
    vbox.default_nic_type = "82543GC"
  end

  hosts.each do |name, ip|
    config.vm.define name do |host|
      host.vm.provider "virtualbox" do |vb|
        vb.cpus = 2
        vb.memory = 4096
        # Don't need the guest extensions on this host.
        if Vagrant.has_plugin?("vagrant-vbguest")
          config.vbguest.auto_update = false
        end
      end

      if name == "ubuntu18"
          host.vm.box = "ubuntu/bionic64"
      else # if name
          host.vm.box = "centos/7"
      end # if name

      host.vm.hostname = name
      host.vm.network "private_network", ip: ip, virtualbox__intnet: private_network_name

      # Fill the hosts file

      host.vm.provision "#{name}-hosts", type: "shell", run: "always", inline: <<-SHELL

        set -e

        fgrep localhost /etc/hosts > /etc/hosts.build
        echo "#{etc_hosts}" >> /etc/hosts.build
        mv -f /etc/hosts.build /etc/hosts
	
      SHELL

   end  # Config

  end  # hosts.each

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.groups = {
      "all:vars" => {
	"ansible_become" => "True",
	"ansible_become_user" => "root",
	"ansible_become_method" => "sudo",
	"perfsonar_os_update" => "False"
      },
      "ps-testpoints" => ["centos7", "ubuntu18"],
      "ps-testpoints:vars" => {
	"perfsonar_archive_auth_interfaces" => "{{ ansible_all_ipv4_addresses }}",
	"perfsonar_archive_hosts" => "{{ groups['ps-archives'] }}"
      },
      "ps-archives" => ["esmond"]
    }
    ansible.limit = "all",
    ansible.playbook = "perfsonar.yml"
  end

end
