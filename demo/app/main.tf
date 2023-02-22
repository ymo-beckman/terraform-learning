terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "consul" {
  address    = "${var.consul-master-ip-address}:8500"
  datacenter = "dc1"
}

resource "docker_image" "todo-app" {
  name         = "demo-todo-app:latest"
  keep_locally = true
}

resource "docker_container" "todo-app" {
  image = docker_image.todo-app.latest

  for_each = var.app-expose-port

  name  = "todo-app-${each.key}"

  env = [
    "spring.cloud.consul.host=${var.consul-host}",
    "spring.datasource.url=jdbc:postgresql://${data.consul_keys.db_host.var.host}:${data.consul_keys.db_port.var.port}/${data.consul_keys.db_name.var.db}",
    "spring.datasource.username=${data.consul_keys.db_user.var.user}",
    "spring.datasource.password=${data.consul_keys.db_password.var.password}",
    "server.port=${each.value}",
    "spring.cloud.consul.discovery.preferIpAddress=true",
  ]

  ports {
    internal = each.value
    external = each.value
  }
}