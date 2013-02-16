# -*- mode: ruby -*-
Vagrant::Config.run do |config|
  config.vm.box = "centos"

  hostname = "192.168.33.11"
  config.vm.network :hostonly, hostname

  config.vm.provision :chef_solo do |chef|
    chef_root = File.expand_path('../chef-repo', __FILE__)
    chef.cookbooks_path = ["#{chef_root}/cookbooks", "#{chef_root}/site-cookbooks"]
    chef.data_bags_path = "#{chef_root}/data_bags"

    if File.exists?("#{chef_root}/nodes/#{hostname}.json")
      json_name = "#{hostname}.json"
    else
      json_name = "node.json"
    end
    json = JSON.parse(File.read("#{chef_root}/nodes/#{json_name}"))
    json.delete("recipes").each do |r|
      chef.add_recipe r
    end
    chef.json.merge!(json)
  end
end
