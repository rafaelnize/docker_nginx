VAGRANTFILE_API_VERSION = "2"
$bootstrap=<<SCRIPT
apt-get update
apt-get -y install wget
wget -qO- https://get.docker.com/ | sh
gpasswd -a vagrant docker
sudo apt-get -y install python-pip
sudo pip install pip --upgrade
sudo pip install -U docker-compose
sudo mkdir /etc/syslog-ng
service docker restart
sudo apt-get install syslog-ng
docker-compose --version
SCRIPT

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
   config.vm.box = "ubuntu/trusty64"

     if Vagrant.has_plugin?("vagrant-cachier")

      # Configure cached packages to be shared between instances of the same base box.
      # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
        config.cache.scope = :box

      # OPTIONAL: If you are using VirtualBox, you might want to use that to enable
      # NFS for shared folders. This is also very useful for vagrant-libvirt if you
      # want bi-directional sync

      config.cache.synced_folder_opts = {
        type: :rsync,
        # The nolock option can be useful for an NFSv3 client that wants to avoid the
        # NLM sideband protocol. Without this option, apt-get might hang if it tries
        # to lock files needed for /var/cache/* operations. All of this can be avoided
        # by using NFSv4 everywhere. Please note that the tcp option is not the default.
        mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
      }
      # For more information please check http://docs.vagrantup.com/v2/synced-folders/basic_usage.html
    end
    config.vm.synced_folder ".", "/mnt", disabled: false
    config.vm.box = "ubuntu/trusty64"
    config.vm.network "forwarded_port", guest: 80, host: 80
    config.vm.network "forwarded_port", guest: 443, host: 443
    config.vm.network "private_network", ip: "192.168.33.25"
    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    config.vm.provision :shell, inline: $bootstrap
end
