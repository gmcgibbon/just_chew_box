# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = 'ubuntu/trusty64'

  # Set our hostname
  config.vm.hostname = 'just-chew'

  # Set a generous boot timeout for chef setup
  config.vm.boot_timeout = 900

  # Configure omnibus plugin chef version
  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = '12.20.3'
  end

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.name = 'just-chew-base'
    vb.customize ['modifyvm', :id, '--memory', '2048']
    # vb.gui = true
  end

  # Configurate push target
  config.push.define 'atlas' do |push|
    push.app = 'gmcgibbon/just_chew'
  end

  # Forward host SSH agent
  config.ssh.forward_agent = true

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3001
  # Forward the PostgreSQL server default port to the host
  config.vm.network :forwarded_port, guest: 5432, host: 5433

  # Enable Vagrant Berkshelf
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    # Install Ruby 2.3.1 and Bundler
    # Set PostgreSQL settings
    chef.json = {
      rbenv: {
        user_installs: [{
          user: 'vagrant',
          rubies: %w(2.3.1),
          global: '2.3.1',
          gems: {
            '2.3.1' => [
              { name: 'bundler' }
            ]
          }
        }]
      },
      postgresql: {
        password: {
          postgres: 'root'
        },
        users: [
          {
            username: 'vagrant',
            password: 'vagrant',
            superuser: true,
          }
        ]
      }
    }

    chef.run_list = [
      'recipe[just_chew::default]'
    ]
  end
end
