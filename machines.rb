#
# 仮想サーバ構成
#

$box_target = "youske/debian-jessie"
$address_start = "192.168.33.20"


$env_config = {

  :general => {
    :box => $box_target,
    :box_update => true,
    :private_ipaddr => $address_start,
    :intnet => "developvm",
    :common_bootstrap_path => "bootstrap.sh"
  },

  :roles => [
    {
      :active => true,
      :name => "manage",
      :cpus => 1,
      :memory => 256,
      :bind_ports => [[3000,3000],[8888,8888]],
      :mount => [ ["..","/app"] ],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    },
    {
      :active => false,
      :name => "frontend",
      :cpus => 1,
      :memory => 256,
      :bind_ports => [ [80,80],[8080,8080] ],
      :mount => [],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    },
    {
      :active => false,
      :name => "backend",
      :cpus => 1,
      :memory => 256,
      :bind_ports => [ [33306,33306] ],
      :mount => [],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    },
    {
      :active => false,
      :name => "cache",
      :cpus => 1,
      :memory => 256,
      :bind_ports => [ [11211,11211] ],
      :mount => [],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    },
    {
      :active => false,
      :name => "log",
      :cpus => 1,
      :memory => 256,
      :bind_ports => [],
      :mount => [],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    }
  ]
}
