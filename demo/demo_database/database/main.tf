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

resource "docker_image" "postgres" {
  name         = "postgres:latest"
  keep_locally = true
}

resource "docker_container" "postgresql" {
  image = docker_image.postgres.latest
  name  = "postgres"
  env = [
    "POSTGRES_DB=${var.db_name}",
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}",
  ]

  ports {
    internal = 5432
    external = var.db_port
  }
}

resource "consul_keys" "db_ip_address" {
  datacenter = "dc1"

  key {
    path    = "demo_app/db/pg/host"
    value   = docker_container.postgresql.ip_address
  }
}

resource "consul_keys" "db_port" {
  datacenter = "dc1"

  key {
    path    = "demo_app/db/pg/port"
    value   = 5432
  }
}

resource "consul_keys" "db_name" {
  datacenter = "dc1"

  key {
    path    = "demo_app/db/pg/db"
    value   = var.db_name
  }
}

resource "consul_keys" "db_user" {
  datacenter = "dc1"

  key {
    path    = "demo_app/db/pg/user"
    value   = var.db_user
  }
}

resource "consul_keys" "pg_password" {
  datacenter = "dc1"

  key {
    path    = "demo_app/db/pg/password"
    value   = var.db_password
  }
}
