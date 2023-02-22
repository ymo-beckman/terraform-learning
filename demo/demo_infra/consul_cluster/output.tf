output "consul-master-ip" {
  value       = docker_container.consul-master.ip_address
}

output "consul-agent-ip-list" {
  value = docker_container.consul-slave.*.ip_address
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.consul.id
}
