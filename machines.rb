#
# 仮想サーバ構成
#

$env_config = {

  :general => {
    :box => "youske/debian-jessie",
    :box_update => true,
    :private_ipaddr => "192.168.33.20",
    :intnet => "developvm",
    :common_bootstrap_path => "bootstrap.sh"
  },

  :roles => [
    {
      :active => true,
      :name => "manage",
      :memory => 256,
      :bind_ports => [],
      :mount => [ ["..","/app"] ],
      :gui => false,
      :bootstrap_path => 'bootstrap_manage.sh'
    },
    {
      :active => false,
      :name => "frontend",
      :memory => 256,
      :bind_ports => [ [80,80],[8080,8080] ],
      :mount => [],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    },
    {
      :active => false,
      :name => "backend",
      :memory => 256,
      :bind_ports => [ [33306,33306] ],
      :mount => [],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    },
    {
      :active => false,
      :name => "cache",
      :memory => 256,
      :bind_ports => [ [11211,11211] ],
      :mount => [],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    },
    {
      :active => false,
      :name => "log",
      :memory => 256,
      :bind_ports => [ [80,80],[8080,8080] ],
      :mount => [],
      :gui => false,
      :bootstrap_path => 'bootstrap.sh'
    }
  ]
}
