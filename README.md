vagrant-centos-nginx_sinatra
==============

Description
-----
vagrant-centos-nginx_sinatra is setup sample of [vagrant](http://www.vagrantup.com/) and [chef-solo](http://wiki.opscode.com/display/chef/Chef+Solo).

When Vagrant up, chef-solo will setup following

+ launch VM CentOS
+ reverse proxy by nginx
+ setup rbenv
+ HelloWorld by Sinatra


Install
-----
    # install vagrant
    $ gem install vagrant
    # setup VM
    $ vagrant box add centos http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box
    
    # setup vagrant-centos-nginx_sinatra
    $ git clone https://github.com/amazedkoumei/vagrant-centos-nginx_sinatra.git
    $ cd vagrant-centos-nginx_sinatra
    $ git submodule init
    $ git submodule update
    
    # launch VM
    $ vagrant up

Access to 192.168.33.11 in your browser When VM has launched.

You can see "Hello! Sinatra is Works!"


Usage
-----
"appuser" has created with installation.

    $ vagrant ssh
    $ su - appuser
    

And app is here.

    $ ls ~/bin
    bundle  config.ru  Gemfile  Gemfile.lock  myapp.rb  rackup.sh


If you want deploy your own app
------------
It would be nice if you install

+ [opscode-cookbooks / application](https://github.com/opscode-cookbooks/application)
+ [opscode-cookbooks / application_nginx](https://github.com/opscode-cookbooks/application_nginx)

install command is

	$ cd vagrant-centos-nginx_sinatra
    $ git submodule add https://github.com/opscode-cookbooks/application.git chef-repo/cookbooks/application
    $ git submodule add https://github.com/opscode-cookbooks/application_nginx chef-repo/cookbooks/application_nginx
    
And setup with referring to the readme…


Thanks
------------
Use as git submodule

+ [opscode-cookbooks / build-essential](https://github.com/opscode-cookbooks/build-essential)
+ [opscode-cookbooks / nginx](https://github.com/opscode-cookbooks/nginx)
+ [opscode-cookbooks / ohai](https://github.com/opscode-cookbooks/ohai)
+ [opscode-cookbooks / yum](https://github.com/opscode-cookbooks/yum)

Used by git clone

+ [opscode-cookbooks / iptables](https://github.com/opscode-cookbooks/iptables)
+ [naoya / vagrant-centos-rbenv_chef](https://github.com/naoya/vagrant-centos-rbenv_chef)