terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

resource "docker_image" "consul" {
  name         = "consul:latest"
  keep_locally = true
}

resource "docker_container" "consul-master" {
  image = docker_image.consul.latest
  name  = "consul_master"

  command = ["agent", "-server", "-bootstrap", "-bootstrap-expect", "1", "-ui", "-client", "0.0.0.0"]

  env = ["CONSUL_BIND_INTERFACE=eth0"]

  ports {
    internal = 8500
    external = 8500
  }
}

resource "docker_container" "consul-slave" {
  image = docker_image.consul.latest
  name  = "consul_slave${count.index}"

  count = var.agent_server_count

  command = ["agent", "-server", "-join", docker_container.consul-master.ip_address]

  env = ["CONSUL_BIND_INTERFACE=eth0"]

  depends_on = [docker_container.consul-master]
}