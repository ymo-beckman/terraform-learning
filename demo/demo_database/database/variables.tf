variable "db_name" {
  type = string
  default = "app_db"
}

variable "db_user" {
  type = string
  default = "app_db_user"
}

variable "db_password" {
  type = string
  default = "password"
}

variable "db_port" {
  type = number
  default = 5432
}

variable "consul-master-ip-address" {
  type = string
  default = "127.0.0.1"
}