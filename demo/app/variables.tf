variable "consul-master-ip-address" {
  type = string
  default = "127.0.0.1"
}

variable "consul-host" {
  type = string
  default = "172.17.0.2"
}

variable "app-expose-port" {
  type = number
  default = 9998
}

data "consul_keys" "db_name" {
  datacenter = "dc1"

  # Read the launch AMI from Consul
  key {
    name    = "db"
    path    = "demo_app/db/pg/db"
  }
}

data "consul_keys" "db_host" {
  datacenter = "dc1"

  # Read the launch AMI from Consul
  key {
    name    = "host"
    path    = "demo_app/db/pg/host"
  }
}

data "consul_keys" "db_user" {
  datacenter = "dc1"

  # Read the launch AMI from Consul
  key {
    name    = "user"
    path    = "demo_app/db/pg/user"
  }
}

data "consul_keys" "db_port" {
  datacenter = "dc1"

  # Read the launch AMI from Consul
  key {
    name    = "port"
    path    = "demo_app/db/pg/port"
  }
}

data "consul_keys" "db_password" {
  datacenter = "dc1"

  # Read the launch AMI from Consul
  key {
    name    = "password"
    path    = "demo_app/db/pg/password"
  }
}
